class User < ActiveRecord::Base

  def city_finder
    SinglesnetApi.find_city(zipcode)
  end
  
  def generate_captcha
    self.captcha_key = SinglesnetApi.captcha_generate
  end
  
end
