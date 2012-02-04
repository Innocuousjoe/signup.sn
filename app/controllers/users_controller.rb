class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def show
    render :new
  end

  def create
    p @user
    p "================"
    p params
    p params[:user]
    p "==============="
    @user = User.create(params[:user])
    p @user
    @user.save!
  end
end
