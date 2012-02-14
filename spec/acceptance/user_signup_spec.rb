require 'acceptance/acceptance_helper'

feature "Users", %q{ I want to be able to create an account } do
  
  scenario "When there are no errors", :js => true do
    VCR.use_cassette('new_user') do
      visit "/users/new"
      # click("#content")
      fill_in "user_zipcode", with: "94110"
      fill_in "user_username", with: "OKCW1999"
      fill_in "user_password", with: "password"
      fill_in "user_email", with: "OKCW1999@sharklasers.com"
      fill_in "user_captcha_answer", with: "buNts"
      click_button "user_submit"
      debugger
      page.should have_content "xyz"
    end
  end

end