class SinglesnetController < ApplicationController
  FORMAT = "xml" 
  API_KEY = "b53671a74a41b3e513e0abf4fdedf3af"
  CID = "10184"
  SINGLESNET_BASE_URL= "http://api.singlesnet.com/api/1.2/signup/submit"
  SINGLESNET_CORE_URL= "/signup/submit/core" + "?key=" + Rails.configuration.singlesnet_api_key + "&format=xml&campaign_id=" + CID
  
  
  attr_reader :errors
  
  def initialize(user)
    @user = user
    create
  end
  
  def create
    poster = SinglesnetApi.new
    hash = {
      "screenname" => "abcpassword1234",
      "email" => @user.email,
      "password" => @user.password,
      "sex" => @user.sex,
      "sex_seeking" => @user.sex_seeking,
      "birthday_month" => @user.birthday_month, #Better to save the birthday as three separate entries?
      "birthday_day" => @user.birthday_day, #Same question
      "birthday_year" => @user.birthday_year,
      "country" => "US",
      "zipcode" => @user.zipcode.to_s,
      "captcha_key" => @user.captcha_key,
      "captcha_answer" => @user.captcha_answer,
      "city" => @user.city_id
      # #Nothing below here is required.  Why are we displaying it.
      #       "height" => @user.height,
      #       "body" => @user.body,
      #       "hair" => @user.hair,
      #       "eye" => @user.eye,
      #       "race" => @user.race,
      #       "occupation" => @user.occupation,
      #       "drinking" => @user.drinking,
      #       "smoking" => @user.smoking,
      #       "about" => @user.about
    }
    @response = poster.class.post(SINGLESNET_CORE_URL, :body => hash)
    # p @response
  end
end
