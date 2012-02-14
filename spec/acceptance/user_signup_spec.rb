require 'acceptance/acceptance_helper'

def do_first_form opts={}
  VCR.use_cassette(opts[:vcr] || 'new_user') do
    visit "/users/new"
    # click("#content")
    fill_in "user_zipcode", with: "94110"
    fill_in "user_username", with: opts[:username] || "OKCW999"
    fill_in "user_password", with: "password"
    fill_in "user_email", with: opts[:email] || "OKCW999@sharklasers.com"
    fill_in "user_captcha_answer", with: "pArADE"
    click_button "user_submit"
  end
end

feature "Users", "I want to be able to get past the first form" do
  
  scenario "When there are no errors", :js => true do
    do_first_form
    page.should have_content "Almost Done!"
  end
  
  scenario "When there are errors", :js => true do
    do_first_form vcr: 'new_user_error', username: "", email: ""
    page.should have_content "is invalid"
  end

end

feature "Users", "I want to be able to get past the second form" do
  
  scenario "When there are no errors", :js => true do
    do_first_form
    VCR.use_cassette('new_user_part_two') do
      page.execute_script('$("select").selectBox("destroy")') # DIE SELECTBOX DIE.  The jquery plugin was irritating me SO I DESTROYED IT
      select "White / Caucasian", :from => "user_race"
      select "Blue", :from => "user_eye"
      select "Dark brown", :from => "user_hair"
      select "Fit / Athletic", :from => "user_body"
      select "6'", :from => "user_height"
      select "Arts", :from => "user_occupation"
      fill_in "user_about", :with => "This is super important text"
      click_button "user_submit"
      page.should have_content "Upload your photo"
    end
  end
  
  # scenario "When there are errors", :js => true do
  #   VCR.use_cassette('new_user_error') do
  #     visit "/users/new"
  #     # click("#content")
  #     fill_in "user_zipcode", with: "94110"
  #     # fill_in "user_username", with: "" # this is blank!  terrible error!
  #     fill_in "user_password", with: "password"
  #     # fill_in "user_email", with: "OKCW1999@sharklasers.com" # Also a grievous error!
  #     fill_in "user_captcha_answer", with: "buNts"
  #     click_button "user_submit"
  #     page.should have_content "is invalid"
  #   end
  # end
end