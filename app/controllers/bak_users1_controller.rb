class Users1Controller < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You're successfully registered in"
      redirect_to root_url
    else
      flash[:danger] = "Oops, something's wrong when you registered"
      redirect_to root_url
    end
  end

  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation)
  end
end
