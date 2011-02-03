require 'mechanize'
require 'linkedin'
require 'utils'

class Creepy
	def initialize
		@profiles = @names = @profile_urls = @groups = []
	end
	
	def login_to_linkedin
		@linkedin = Linkedin.new.login
	end
	
	def search_for_courageous_executives
		(1...2).each do |search_page_number|
			search_results_page = @linkedin.search_page(:company => :ThoughtWorks, :page_num => search_page_number)
			break if (profiles = search_results_page.profiles).empty?
			@profiles += profiles
		end
	end
	
	def get_groups_of_courageous_executives
		@profiles.each do |profile|
			@groups += groups_of(profile[:link]) 
		end
	end

	def print
		@groups.each do |group|
			puts group[:name]
			puts Linkedin::BASE_URL + group[:link]
			puts "~"*10
			return true if group == @groups.last
		end

		@profiles.each do |profile|
			puts profile[:name].inspect
			puts Linkedin::BASE_URL + profile[:link]
			puts "~"*10
		end
	end
	
	private
	def groups_of profile
		home_page = @linkedin.get(Linkedin::BASE_URL + profile)
		home_page.groups
	end
	
end