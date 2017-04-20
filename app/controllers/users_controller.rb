class UsersController < ApplicationController

  def show
    @user = User.find_by id: params[:id]
    unless @user
      flash[:error] = t "notfound"
      redirect_to signup_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "flash"
      redirect_to @user
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
