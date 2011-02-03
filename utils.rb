require 'mechanize'
class Mechanize
	class Page
		def profiles
			profiles  = []
			profile_tags.each do |profile|
				name  = [profile.children[1].children.text, profile.children[3].children.text].join(" ")
				profiles << { :link =>profile[:href], :name => name}
			end
			profiles
		end
		
		def groups
			groups = []
			
			group_tags.each do |group_tag|
				groups << {:link => group_tag.children[1][:href], :name => group_tag.children[1].children[2].children.text}
			end
			groups
		end
		
		private
		def profile_tags
			search("a[title = 'View Profile']")
		end
		
		def group_tags
			search(".affiliation")
		end
		
	end
end