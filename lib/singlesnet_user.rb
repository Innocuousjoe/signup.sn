# Construct a redirect URL for a user posting to Singlesnet.com
module SinglesnetUser
  
  CID = "10184"
  SINGLESNET_BASE_URL= "http://api.singlesnet.com/api/1.2/signup/submit"
  SINGLESNET_CORE_URL= "/signup/submit" + "?key=" + Rails.configuration.singlesnet_api_key + "&format=xml&campaign_id=" + CID
  
  def construct_url
    p "no, I am here"
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
      "drink" => self.drinking,
      "smoke" => self.smoking,
      "personal_description_wanted" => self.about,
      "sports_play" => "no",
      "smoke" => "no",
      "drink" => "no",
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
    response = poster.class.post(SINGLESNET_CORE_URL, :body => hash)
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
