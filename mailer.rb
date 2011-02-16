require 'rubygems'
require 'action_mailer'

class Mailer < ActionMailer::Base

  def profile_email file_name, address
    recipients(address)
    from "linbot@gmail.com"
    subject "Users of the Linked in Group"
    body <<-body
Hey,
Find attached herewith the members of the linked in group as requested by you over chat.
Hope I saved you some time.

Thanks
Linbot

    body

    attachment "application/vnd.ms-excel" do |a|
      a.body = File.read(file_name)
      a.filename = file_name
    end
  end

  def help_email address
    recipients address
    from "linbot@gmail.com"
    subject "Help Provided"
    body <<-body
Hey,
Here are the commands that I can understand.
1)help me out: I will send you this mail

2)members of <linked in url>
eg: members of http://www.linkedin.com/groups?mostPopular=&gid=43083
Ensure that you I am a mamber of the group you want me to crawl. Only members of a group can view other members.

3)username: Will tell you the username that you need to use to become  a member to the group. Contact csouza@thoughtworks.com for the password.

During the course of our conversation, if you find that I have gone offline, dont panic! I will be back in a few seconds. Just remind me about what you wanted. I tend to forget things.

Thanks
Linbot

    body

  end
end
