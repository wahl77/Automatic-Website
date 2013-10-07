require "spec_helper"


describe "Facebook" do
  it "wish happy birthday", js: true do
    visit "http://www.facebook.com/events/list"
    user_info = get_user_info
    fill_in "email", with: user_info[:email]
    fill_in "pass", with: user_info[:password]
    click_on "Log In"
    #within "span.fbRemindersTitle" do find("strong").click end
    #within("#birthday_reminders_link") do find("i").click end
    #page.all(:css, "textarea[title$='Write a birthday wish on his timeline...']").each {|x| x.set(get_message)}
    #page.all(:css, "textarea[title$='Write a birthday wish on her timeline...']").each {|x| x.set(get_message)}
    page.all(:css, "textarea[title*='birthday']").each {|x| x.set(get_message); counter +=1}
  end

  # Get user information either from an environment variable of via keychain if using MacOSX and no environment variables
  # are set. Information is returned in the form of a hash with keys email and password
  def get_user_info
    # Return env variable if it is set
    pid = {}
    key_chain_data = `security find-internet-password -g -s www.facebook.com 2>&1`
    pid[:password] = ENV['FACEBOOK_PASS'] ?  ENV['FACEBOOK_PASS'] : key_chain_data.scan(/password: .*/).first.scan(/\".*\"/).first.gsub(/\"/, "")
    pid[:email] = ENV['FACEBOOK_USER'] ?  ENV['FACEBOOK_USER'] : key_chain_data.scan(/acct.*/).first.scan(/\".*\"/).first.gsub(/\"/, "").gsub("<blob>=", "")
    return pid
  end

  # Default message that is send
  # Further implementation will allow to send different messages to different people
  def get_message(user = nil)
    return "Happy birthday!!! (This was an automatically generated message)\n"
  end
end
