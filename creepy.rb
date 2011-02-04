require 'mechanize'
require 'linkedin'
require 'utils'

class Creepy
	def initialize
		@groups = @members = []
	end
	
	def login_to_linkedin
		@linkedin = Linkedin.new.login
	end
	
	def get_groups_of_courageous_executive profile_url
		@groups += groups_of profile_url
	end

	def print
		response = ""
		@members.each do |member|
			puts member[:name]
			puts member[:profile]
			puts "~" * 10
			return true if member == @members.last
		end
		
		@groups.each do |group|
			response += "#{group[:name]} | #{Linkedin::BASE_URL + group[:link]} \n\r"
		end
		
		response
	end
	
	def get_group_members
		group = "/groups?mostPopular=&gid=43083&trk=myg_ugrp_ovr"
		profiles_of group 
	end
	
	private
	def groups_of profile
		home_page = @linkedin.get profile
		home_page.groups
	end
	
	def profiles_of group
		(1..10).each do |page_num|
			members_page = @linkedin.get(Linkedin::BASE_URL + @linkedin.next_members_link_of(group, page_num))
			@members += members_page.members
		end
	end
	
end