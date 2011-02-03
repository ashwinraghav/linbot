require 'mechanize'

class Linkedin
	BASE_URL = "http://www.linkedin.com"
	SEARCH_URL = "#{BASE_URL}/search/fpsearch"
	COOKIE_FILE = "cookies.txt"
		
	USERNAME = "surabhi171086@gmail.com" 
	PASSWORD = "agentsmith"

	def initialize 
		@agent = Mechanize.new
	end
	
	def login
		curl_and_store_sessions
		@agent.cookie_jar.load(COOKIE_FILE, :cookiestxt)
	end
	
	def search_page criteria
		@agent.get("#{SEARCH_URL}?company=#{criteria[:company]}&currentCompany=PNC&page_num=#{criteria[:page_num]}")
	end
	
	def get url
		@agent.get(url)
	end
	
	private
	def curl_and_store_sessions
		`curl --cookie-jar #{COOKIE_FILE} -so/dev/null -Fsession_login= -Fsession_rikey= -Fsession_key=#{USERNAME} -Fsession_password=#{PASSWORD} https://www.linkedin.com/secure/login?trk=hb_signin`
	end
end
