class User < ActiveRecord::Base
  include SinglesnetUser
  
  after_validation :construct_core_key
    
  attr_accessor :redirect_url, :flash_error, :shortcut
    
  def city_finder
    SinglesnetApi.find_city(zipcode)
  end
  
  def generate_captcha
    self.captcha_key = SinglesnetApi.captcha_generate
  end
  
end
