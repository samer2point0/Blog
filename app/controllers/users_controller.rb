class UsersController < ApplicationController
  before_action :require_login, except:[:new, :create]

  def show
    @user=User.find(params[:id])
  end

  def new
    @user= User.new()
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
    @user= current_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        flash[:success]='user was successfully created.'
        auto_login(@user, should_remember:user_params[:remember_me])
        format.html { redirect_to @user }
        format.js {redirect_back_or_to(@user, remote:true)}
      else
        format.html {render :new}
        format.js {render :new}
      end
    end
  end

  def update
    @user=current_user
    respond_to do |format|
      if @user.save
        flash[:success]='user was successfully updated.'
        format.html { redirect_to @user }
        format.js {redirect_to(@user, remote:true)}
      else
        format.html {render :edit}
        format.js {render :edit}
      end
    end
  end

  private
    def user_params
      params.require(:user).permit( :email, :username, :password, :password_confirmation, :remember_me)
    end
end
