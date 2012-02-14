class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(session[:user_id])
    p @user
  end

  def create
    @user = User.new(params[:user]) 
    @user.construct_core_key
    
    if @user.errors.empty?
      @user.save!
      session[:user_id] = @user.id
      redirect_to edit_user_path(@user.id)
    else 
      flash.now[:error] = @user.flash_error
      render :new
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
