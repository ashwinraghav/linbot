require 'rubygems'
require 'creepy'
require 'marvin'

class UserGroups
include Marvin::Handler
command :regex => /keyword/, :syntax => "keyword", :description => "Does nothing"

  def handle(from, body, bot)
	creepy = Creepy.new
	creepy.instance_eval do
		login_to_linkedin && get_groups_of_courageous_executive("http://www.linkedin.com/profile/view?id=8779") 
		response  = print
		bot.reply(from, response)
	end
  end
  
end

bot = Marvin::Android.new("1ashwinraghav@gmail.com", "raghavendrasai")
bot.listen

#~ def something
	#~ creepy = Creepy.new
	#~ creepy.instance_eval do
		#~ login_to_linkedin && get_groups_of_courageous_executive("http://www.linkedin.com/profile/view?id=8779") 
		#~ response  = print
		#~ puts response
	#~ end
#~ end

#~ something