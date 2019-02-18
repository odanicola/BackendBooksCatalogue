class SessionsController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update], except: [:new]

  def index

  end

  def new
    # skip_before_action :require_login
  end

  def create
    user = User.authentication(params[:email],params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = "You're successfully logged in!"
      redirect_to welcome_index_path
    else
      flash[:danger] = "Oops, Invalid email or password, please try it again!"
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:email,:password)
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "Logged out, Goodbye!"
    redirect_to root_url
  end
end
