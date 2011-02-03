creepy.rb
def join_groups_of_courageous_executives
	@groups.each do |group|
		join_group group
	end
end

def join_group group
	join_url = group
	
	join_url["/groups?"] = "/groupRegistration?"
	group_home = @linkedin.get(Linkedin::BASE_URL + join_url)
	join_form = group_home.form_with(:action => '/groupRegistration')
	if join_form
		puts "joined" + Linkedin::BASE_URL + join_url
		join_form.click_button
	else
		puts "rejected" + Linkedin::BASE_URL + join_url
	end
end



crawler.rb
def join_groups_of_ex_thoughtworkers
	creepy = Creepy.new
	creepy.login_to_linkedin
	creepy.search_for_courageous_executives
	creepy.get_groups_of_courageous_executives
	creepy.join_groups_of_courageous_executives
end