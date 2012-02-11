class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user]) 
    @user.construct_core_key
    @user.save!
    if (@user.flash_error)
      flash.now[:error] = @user.flash_error
      render :new
    else
      session[:validity] = true
      session[:user_id] = @user.id
      render "profile/new"
    end
  end

  def update
    if (session[:user_id])
      @user = User.find(session[:user_id])
    else
      @user = User.find(params[:user])
    end
    if (session[:validity])
      @user.update_attributes(params[:user])
      @user.construct_full_url
      if (@user.flash_error)
        flash[:error] = @user.flash_error
        render :new
      else
        redirect_to @user.redirect_url
      end
    else
      @user.update_attributes(params[:user])
      @user.construct_core_key
      if (@user.flash_error)
        flash.now[:error] = @user.flash_error
        render :new
      else
        session[:user_id] = @user.id
        render "profile/new"
      end
    end
  end

end
