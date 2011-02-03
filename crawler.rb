require 'rubygems'
require 'creepy'

def print_ex_thoughtworkers
	creepy = Creepy.new
	creepy.instance_eval do
		(login_to_linkedin && search_for_courageous_executives && print) || (puts "Something went wrong")
	end
end

def print_groups_of_thoughtworkers
	creepy = Creepy.new
	creepy.instance_eval do
		(login_to_linkedin && search_for_courageous_executives && get_groups_of_courageous_executives && print) || (puts "Something went wrong")
	end
end

#~ print_ex_thoughtworkers
print_groups_of_thoughtworkers