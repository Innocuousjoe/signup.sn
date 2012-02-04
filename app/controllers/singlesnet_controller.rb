class SinglesnetController < ApplicationController
  SINGLESNET_BASE_URL = "http://api.singlesnet.com/api/1.2/signup/submit"
  API_KEY = b53671a74a41b3e513e0abf4fdedf3af
  CID = 10184
  attr_reader :errors
  
  def create
    @errors = {}
    params = {
      email: @user.email
      password: @user.password
      sex: @user.sex
      sex_seeking: @user.sex_seeking
      birthday_month: parse_birthday(@user.birthday)[0] #Better to save the birthday as three separate entries?
      birthday_day: parse_birthday(@user.birthday)[1] #Same question
      birthday_year: parse_birthday(@user.birthday)[2]
      country: @user.country
      zipcode: @user.zipcode
      captcha_key: CAPTCHA
      captcha_answer: @user.captcha_answer
      #Nothing below here is required.  Why are we displaying it.
      height: @user.height
      body: @user.body
      hair: @user.hair
      eye: @user.eye
      race: @user.race
      occupation: @user.occupation
      drinking: @user.drinking
      smoking: @user.smoking
      about: @user.about
    }
  end
end
