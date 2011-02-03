require 'mechanize'
require 'linkedin'
require 'utils'

class Creepy
	def initialize
		@profiles = @names = @profile_urls = @groups = []
	end
	
	def login_to_linkedin
		@linkedin = Linkedin.new
		@linkedin.login
	end
	
	def search_for_courageous_executives
		(1...2).each do |search_page_number|
			search_results_page = @linkedin.search_page(:company => :ThoughtWorks, :page_num => search_page_number)
			break if (profiles = search_results_page.profiles).empty?
			@profiles += profiles
		end
		self
	end
	
	def get_names_of_courageous_executives
		@names.each do |name|
			p name.to_s
		end
	end

	
	def get_groups_of_courageous_executives
		@profiles.each do |profile|
			@groups += groups_of(profile) 
		end
	end

	def get_group_names_of_courageous_executives
		names = []
		@profiles.each do |profile|
			names += group_names_of profile 
		end
		names
	end		
	
	def print
		@profiles.each do |profile|
		 puts profile.inspect
		end
	end
	
	private
	
	def groups_of profile
		home_page = @linkedin.get(Linkedin::BASE_URL + profile)
		home_page.groups
	end
	
	def group_names_of profile
		home_page = @linkedin.get(Linkedin::BASE_URL + profile)
		names = []
		home_page.group_names.each do |gn|
			names << gn.to_s
		end
		names
	end
	
end