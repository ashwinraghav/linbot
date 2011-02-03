require 'mechanize'
class Mechanize
	class Page

		def join
			raise join_tag.inspect
		end
		
		def group_names
			begin
				group_tags.children[1].children[2].children
			rescue
				[]
			end
		end
		
		def people_names
			profiles = profile_tags
			names  = []
			profiles.each do |profile|
				names << profile.children[1].children + profile.children[3].children
			end
			names
		end
		
		def profiles
			profiles  = []
			profile_tags.each do |profile|
				profiles << { :link =>profile[:href], :name => profile.children[1].children + profile.children[3].children}
			end
			profiles
		end
		
		def groups
			urls = []
			group_tags.each do |group_tag|
				urls << group_tag.children[1][:href]
			end
			urls
		end
		
		
		private
		def profile_tags
			search("a[title = 'View Profile']")
		end
		
		def group_tags
			search(".affiliation")
		end
		
		def join_tag
			search(".btn-primary")
		end

	end
end