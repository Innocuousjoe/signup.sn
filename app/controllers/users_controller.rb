class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end
  
  def show
    render :new
  end

  def create
    p @user
    @user.create!
  end
end
