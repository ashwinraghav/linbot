require 'rubygems'
require 'creepy'

def print_ex_thoughtworkers
	creepy = Creepy.new
	creepy.login_to_linkedin
	creepy.search_for_courageous_executives.print
end
	
#~ def get_groups_of_ex_thoughtworkers
	#~ creepy = Creepy.new
	#~ creepy.login_to_linkedin
	#~ creepy.search_for_courageous_executives
	#~ creepy.get_groups_of_courageous_executives
	#~ creepy.get_group_names_of_courageous_executives
#~ end

print_ex_thoughtworkers