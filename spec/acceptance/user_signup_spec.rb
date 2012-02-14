require 'acceptance/acceptance_helper'

feature "Users", %q{ I want to be able to create an account } do
  
  scenario "When there are no errors", :js => true do
    visit "/users/new"
    # click("#content")
    # fill_in "#user_zipcode", with: "94110"
    # fill_in "#user_username", with: ""
    page.should have_content "I am a"
  end

end