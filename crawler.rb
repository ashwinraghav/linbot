require 'rubygems'
require 'creepy'
require 'spreadsheet_service'
require 'mailer'

class UserGroups
  include Marvin::Handler
  command :regex => /members of http.*/, :syntax => "keyword", :description => "Does nothing"

  def handle(from, body, bot)
    group = group_url_from body

    bot.reply(from, "Crawling...")

    group_members = Creepy.new.instance_eval do
      login_to_linkedin && find_group_members(group)
    end

    file_name = SpreadsheetService.print :members => group_members
    send_mail file_name, from
    bot.reply(from, "I have sent you a mail with the members\nCheck your inbox for a mail from linbot")
  end

  private
  def group_url_from body
    body.match("http.*").to_s
  end

  def send_mail file_name, to
    Mailer.delivery_method = :sendmail
    Mailer.deliver_profile_email(file_name, to)
  end
end

class Help
  include Marvin::Handler
  command :regex => /help me out.*/, :syntax => "help me out <linked in group url>", :description => "must already be a member of the group"

  def handle(from, body, bot)
    send_mail from
    bot.reply(from, "I have sent you a mail that wi	ll help you understand how we can interact. \n It could be in your spam folder.")
  end

  private
  def send_mail to
    Mailer.delivery_method = :sendmail
    Mailer.deliver_help_email to
  end
end

class Username
  include Marvin::Handler
  command :regex => /username.*/, :syntax => "username", :description => "Return the username that the crawler uses"

  def handle(from, body, bot)
    bot.reply(from, "I crawl linked in as #{Linkedin::USERNAME}")
  end
end

class Default
  include Marvin::Handler
  command :regex => /.*/, :syntax => "", :description => "default handler"

  def handle(from, body, bot)
    bot.reply(from, "type 'help me out' if you need help")
  end
end

# def from
# "armohan@thoughtworks.com"
# end
#
# def something
# group = "http://www.linkedin.com/groups?mostPopular=&gid=81780&trk=myg_ugrp_ovr"
# creepy = Creepy.new
# members = creepy.instance_eval do
# login_to_linkedin && find_group_members(group)
# end
#
#
# file_name = SpreadsheetService.print :members => members
# Mailer.delivery_method = :sendmail
# Mailer.deliver_profile_email(file_name, from)
# end
# something