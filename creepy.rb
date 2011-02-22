require 'rubygems'
require 'linkedin'
require 'utils'
require 'cgi'

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
    group_page = @linkedin.get(group)
    members_page = @linkedin.click(group_page.link_with(:text => "Members"))
    [1..100].each do |page_num|
      @members += page.members
      break unless page.link_with(:text => /next/)
      members_page = @linkedin.click(page.link_with(:text => /next/))
    end
  end

end