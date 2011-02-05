require 'rubygems'
require 'creepy'
require 'marvin'
require "spreadsheet_service"

class UserGroups
include Marvin::Handler
command :regex => /keyword/, :syntax => "keyword", :description => "Does nothing"

  def handle(from, body, bot)
	creepy = Creepy.new
	members = creepy.instance_eval do
		login_to_linkedin && find_group_members
	end	
	file_name = SpreadsheetService.print :members => members
  end
  
end

bot = Marvin::Android.new("1ashwinraghav@gmail.com", "raghavendrasai")
bot.listen

def something
	creepy = Creepy.new
	members = creepy.instance_eval do
		login_to_linkedin && find_group_members
	end	
	file_name = SpreadsheetService.print :members => members
end

somethings