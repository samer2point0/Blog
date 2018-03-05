class UsersController < ApplicationController
  before_action :require_login, except:[:new, :create]

  def show
  end

  def new
    @user= User.new()
    respond_to do |format|
      format.html { redirect_to signup_path }
      format.js
    end
  end

  def edit
    @user= current_user
    respond_to do |format|
      format.html { redirect_to edit_user_path(@user) }
      format.js
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'user was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  private
    def user_params
      params.require(:user).permit( :email, :username, :password, :password_confirmation)
    end
end
