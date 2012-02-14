require 'spec_helper'

describe User do
  it "should populate errors appropriately" do
    VCR.use_cassette('empty_user') do
      @user = User.new
      @user.save.should_not be
      @user.errors[:base].should be
    end
  end
end