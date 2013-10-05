require "spec_helper"


describe "Facebook" do
  it "wish happy birthday", js: true do
    visit "http://www.facebook.com"
    fill_in "email", with: ENV['FACEBOOK_USER']
    fill_in "pass", with: ENV['FACEBOOK_PASS']
    click_on "Log In"
    within "span.fbRemindersTitle" do
      click_on "today"
    end
    sleep 10
  end
end
