class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(session[:user_id])
  end

  def create
    @user = User.new(params[:user]) 
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user.id)
    else 
      flash.now[:error] = @user.flash_error
      render :new
    end
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update_attributes(params[:user])
      redirect_to @user.redirect_url
    else
      render :edit
    end
  end
    
end
