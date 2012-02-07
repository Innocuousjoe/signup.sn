class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    render :new
  end

  def create 
    @user = User.create(params[:user]) 
    @user.city_finder  
    @user.save!
    redirect_to @user.construct_url
  end
  
end
