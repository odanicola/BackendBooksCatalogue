class ApiController < ApplicationController
  protect_from_forgery
  def index

  end

  def books
    @books = Book.all
    render json: @books
  end

  def show
    @book = Book.find(params[:id])
    render json: @book
  end

  def signin
    render json: params[:user][:password]
  end

  def getuser
    if params != nil
      @user = User.select(:id,:email).where(email: params[:email])
      if @user != nil
        render json: @user
      else
        render json: params[:email]
      end
    else
      render json: params[:email]
    end


  end
end
