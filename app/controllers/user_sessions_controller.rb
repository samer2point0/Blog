class UserSessionsController < ApplicationController
  before_action :require_login, only:[:destroy]

  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @user=login(session_params)
    if(@user)
      flash[:success] = "welcome " +@user.username
      redirect_back_or_to root_url
    else
      debugger
      flash[:danger]= 'invalid username/password cobmination'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url
    flash[:notice] = "logged out!"
  end

  private
    def session_params
      params.require(:user_sessions).permit(:email, :password, :username, :remember_me)
    end
end
