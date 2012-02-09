class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user]) 
    @user.city_finder if @user.zipcode
    @user.save!
    @user.construct_url
    if (@user.flash_error)
      flash.now[:error] = @user.flash_error
      render :new
    else
      redirect_to @user.redirect_url
    end
  end
  
  def update
    @user = User.find(params["id"])
    @user.city_finder if @user.zipcode
    @user.save!
    @user.construct_url
    if (@user.flash_error)
      flash[:error] = @user.flash_error
      render :new
    else
      redirect_to @user.redirect_url
    end
  end

end
