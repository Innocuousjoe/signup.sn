class SinglesnetApi
   include HTTParty
   
   base_uri "http://api.singlesnet.com/api/1.2"
   
   def self.captcha_generate
     #Get the captcha key
     response = post(captcha_key)
     key = Nokogiri::XML.parse(response.body).css("captcha").attribute("key").value
   end
   
   def self.find_city(zipcode)
     geo_url = "/signup/zipcode/US/" + zipcode.to_s + "?key=" + Rails.configuration.singlesnet_api_key + "&format=xml"
     city = post(geo_url)
     id = Nokogiri::XML.parse(city.body).css("city").attribute("id").value
   end
   
   def self.captcha_key
     "/signup/captcha?key=" + Rails.configuration.singlesnet_api_key + "&format=xml" 
   end
   
   def self.post_for_core
     post("/signup/core?key=" + Rails.configuration.singlesnet_api_key + "&format=xhtml")
   end
   
   def self.captcha_img
     "/signup/captcha_image?key=" + Rails.configuration.singlesnet_api_key + "&format=xml&captcha_key="
   end
   
   def self.captcha_img_url(key)
     base_uri + captcha_img + key
   end
end