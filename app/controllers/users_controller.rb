class UsersController < ApplicationController
  def new
    @user = User.create(params[:user])
    if @user   
      render :landing
    else
      p "error!"
    end
  end
  
  def show
    render :new
  end

  def create  
    @user.save!
  end
end
