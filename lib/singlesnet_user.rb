# Construct a redirect URL for a user posting to Singlesnet.com
module SinglesnetUser
  
  CID = "10184"
  SINGLESNET_BASE_URL= "http://api.singlesnet.com/api/1.2/signup/submit"
  SINGLESNET_CORE_URL= "/signup/submit" + "?key=" + Rails.configuration.singlesnet_api_key + "&format=xml&campaign_id=" + CID
  
  def construct_url
    poster = SinglesnetApi.new
    hash = {
      "screenname" => self.username,
      "email" => self.email,
      "password" => self.password,
      "sex" => self.sex,
      "sex_seeking" => self.sex_seeking,
      "birthday_month" => self.birthday_month, 
      "birthday_day" => self.birthday_day,
      "birthday_year" => self.birthday_year,
      "country" => "US",
      "zipcode" => self.zipcode.to_s,
      "captcha_key" => self.captcha_key,
      "captcha_answer" => self.captcha_answer,
      "city" => self.city_id,
      "height" => self.height,
      "bodytype" => self.body,
      "hair_color" => self.hair,
      "eye_color" => self.eye,
      "race" => self.race,
      "occupation" => self.occupation,
      "drink" => self.drink,
      "smoke" => self.smoke,
      "personal_description_wanted" => 1,
      "personal_description" => self.about,
      "sports_play" => 0,
      "smoke" => 0,
      "drink" => 0,
      "exercise" => 0,
      "outdoor" => 0,
      "artistic" => 0,
      "religion" => 0,
      "sports_fan" => 0,
      "pet" => 0,
      "race_date" => 0,
      "country_date" => 0,
      "diet" => 0,
      "relationship_serious" => 0,
      "children" => 0,
      "children_date" => 0,
      "high_school" => 0,
      "college" => 0
    }
    p self
    p "========"
    response = poster.class.post(SINGLESNET_CORE_URL, :body => hash)
    p response
    if (Nokogiri::XML.parse(response.body).css("success").empty?) then
      parse_errors(response)
    else
      self.redirect_url = Nokogiri::XML.parse(response.body).css("success").text 
    end
  end
  
  def parse_errors(response)
    self.flash_error = response.parsed_response["failure"]["message"]
  end
end
