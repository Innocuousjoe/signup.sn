class SinglesnetController < ApplicationController
  CID = "10184"
  SINGLESNET_BASE_URL= "http://api.singlesnet.com/api/1.2/signup/submit"
  SINGLESNET_CORE_URL= "/signup/submit" + "?key=" + Rails.configuration.singlesnet_api_key + "&format=xml&campaign_id=" + CID
  
  
  attr_accessor :errors, :redirect_url
  
  def initialize(user)
    @user = user
    create
  end
  
  def create
    poster = SinglesnetApi.new
    hash = {
      "screenname" => @user.username,
      "email" => @user.email,
      "password" => @user.password,
      "sex" => @user.sex,
      "sex_seeking" => @user.sex_seeking,
      "birthday_month" => @user.birthday_month, 
      "birthday_day" => @user.birthday_day,
      "birthday_year" => @user.birthday_year,
      "country" => "US",
      "zipcode" => @user.zipcode.to_s,
      "captcha_key" => @user.captcha_key,
      "captcha_answer" => @user.captcha_answer,
      "city" => @user.city_id,
      "height" => @user.height,
      "bodytype" => @user.body,
      "hair_color" => @user.hair,
      "eye_color" => @user.eye,
      "race" => @user.race,
      "occupation" => @user.occupation,
      "drink" => @user.drinking,
      "smoke" => @user.smoking,
      "personal_description_wanted" => @user.about,
      "sports_play" => "no",
      "exercise" => "no",
      "outdoor" => "no",
      "artistic" => "no",
      "religion" => "no",
      "sports_fan" => "no",
      "pet" => "no",
      "race_date" => "no",
      "country_date" => "no",
      "diet" => "no",
      "relationship_serious" => "no",
      "children" => "no",
      "children_date" => "no",
      "high_school" => "no",
      "college" => "no",
    }
    @response = poster.class.post(SINGLESNET_CORE_URL, :body => hash)
    Nokogiri::XML.parse(@response.body).css("success").text
  end

end
