class ProfileController < ApplicationController
  
  def new
    render :new
  end
  
  def create
    @profile.construct_full_url
    @profile.save!
    if(@user.flash_error) then
      flash.now[:error] = @user.flash_error
      render :new
    else
      redirect_to @user.redirect_url
    end
  end
  
  def update
  end
  
end