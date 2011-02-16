require 'rubygems'
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
    #~ file_name = ResponseConstructionService.print :members => @members
    #~ response = ""
    #~ @members.each do |member|
    #~ response += "#{member[:name]}\n#{member[:profile]}\n\r"
    #~ end

    #~ @groups.each do |group|
    #~ response += "#{group[:name]} | #{Linkedin::BASE_URL + group[:link]} \n\r"
    #~ end

    #~ response
  end

  def find_group_members group
    profiles_of group
    @members
  end

  private
  def groups_of profile
    home_page = @linkedin.get profile
    home_page.groups
  end

  def profiles_of group
    (1..10).each do |page_num|
      members_page = @linkedin.get(@linkedin.next_members_link_of(group, page_num))
      @members += members_page.members
      group += "&sik=" + Addressable::URI.parse(members_page.uri.to_s).query_values["sik"] if page_num == 1
    end
  end

end