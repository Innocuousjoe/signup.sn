require 'acceptance/acceptance_helper'

def do_first_form opts={}
  VCR.use_cassette(opts[:vcr] || 'new_user') do
    visit "/users/new"
    # click("#content")
    fill_in "user_zipcode", with: "94110"
    fill_in "user_username", with: opts[:username] || "OKCW999"
    fill_in "user_password", with: "password"
    fill_in "user_email", with: opts[:email] || "OKCW999@sharklasers.com"
    fill_in "user_captcha_answer", with: opts[:captcha] || "pArADE"
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

  scenario "When there is exactly one error", :js => true do
    do_first_form vcr: 'new_user_one_error', username: "fnaekwlfameafo", email: "dfwemnqnoriwenqldas@sharklasers.com", captcha: "" # broken captcha!
    page.should have_content "CAPTCHA Answer was empty."
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
  
  scenario "When there are errors", :js => true do
    do_first_form(:vcr => 'new_user_error_two', :email => "OKCW1111@sharklasers.com", :username => "OKC1111", :captcha => "dabbED")
    VCR.use_cassette('new_user_part_two_with_errors') do
      page.execute_script('$("select").selectBox("destroy")') # DIE SELECTBOX DIE.  The jquery plugin was irritating me SO I DESTROYED IT
      select "White / Caucasian", :from => "user_race"
      select "Dark brown", :from => "user_hair"
      select "Fit / Athletic", :from => "user_body"
      select "6'", :from => "user_height"
      fill_in "user_about", :with => "This is super important text"
      click_button "user_submit"
      debugger
      page.should have_content "What is your occupation?"
    end
  end
end