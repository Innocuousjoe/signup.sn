module UsersHelper
  FORMAT = "xml"
  API_KEY = "b53671a74a41b3e513e0abf4fdedf3af"
  CAPTCHA_KEY = "/signup/captcha?key=" + API_KEY + "&format=" + FORMAT 
  CAPTCHA_IMG = "/signup/captcha_image?key=" + API_KEY + "&format=" + FORMAT + "&captcha_key="

  def captcha_generate
    captcha = CaptchaApi.new
    #Get the captcha key
    response = captcha.class.post(CAPTCHA_KEY)
    key = Nokogiri::XML.parse(response.body).css("captcha").attribute("key").value
    @user.captcha_key = key
    # p "============="
    #    p @user
    #    p "============="
    "http://api.singlesnet.com/api/1.2" + CAPTCHA_IMG + key
  end
  
  
end
