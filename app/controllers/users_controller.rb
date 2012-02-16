class UsersController < ApplicationController
  
  before_filter :variation
  layout :nil, :only => :interstitial
  def new
    @user = User.new
    render "new_v#{@variation}"
  end
  
  def edit
    @user = User.find(session[:user_id])
    render "edit_v#{@variation}"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user.id, :variation => @variation)
    else 
      flash.now[:error] = @user.flash_error
      render "new_v#{@variation}"
    end
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update_attributes(params[:user])
      session[:redirect_url] = @user.redirect_url
      redirect_to interstitial_users_url
    else
      render "edit_v#{@variation}"
    end
  end
  
  def interstitial

  end
  
  private
  
  def variation
    @variation = (params[:variation] || 1)
  end
    
end
