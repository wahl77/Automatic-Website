require "spec_helper"


describe "Facebook" do
  it "wish happy birthday", js: true do
    visit "http://www.facebook.com"
    fill_in "email", with: get_facebook_user
    fill_in "pass", with: get_facebook_password
    click_on "Log In"
    binding.pry
    within "span.fbRemindersTitle" do find("strong").click end
    sleep 10
  end



  def get_facebook_password
    # Return env variable if it is set
    return ENV['FACEBOOK_PASS'] if ENV['FACEBOOK_PASS']
    value = `security find-internet-password -g -a wahl77+facebook@gmail.com -s www.facebook.com 2>&1`
    return value.scan(/password: .*/).first.scan(/\".*\"/).first.gsub(/\"/, "")
  end

  def get_facebook_user
    return ENV['FACEBOOK_USER'] if ENV['FACEBOOK_USER']
  end
end
