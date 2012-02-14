class User < ActiveRecord::Base
  include SinglesnetUser
  
  after_validation :construct_core_key, if: :new_record?
  after_validation :construct_full_url, unless: :new_record?
    
  attr_accessor :redirect_url, :flash_error, :shortcut
    
  def city_finder
    SinglesnetApi.find_city(zipcode)
  end
  
  def generate_captcha
    self.captcha_key = SinglesnetApi.captcha_generate
  end
  
end
