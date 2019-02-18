class BooksController < ApplicationController
  # before_action :authenticate_user!

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @subjects = Subject.all
  end

  def create
    if Book.last.code === params[:book][:code]
      flash[:danger] = "SKU number already exists"
      redirect_to :action => 'new'
    else
      @book = Book.new(book_params)
      if @book.save
        flash[:success] = "Book has successfully been added"
        redirect_to :action => @books
      else
        @subjects = Subject.all
        flash[:danger] = @book.errors.full_messages
        redirect_to :action => 'new'
      end
    end
  end

  def book_params
    # id = get_max_code
    params.require(:book).permit(:title, :code, :price, :subject_id, :description)

  end

  def get_max_code
    max_code = Book.last.code.to_i + 1
  end

  def edit
    @book = Book.find(params[:id])
    @subjects = Subject.all
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book has been updated"
      redirect_to :action => 'show', :id => @book
    else
      @subjects = Subject.all
      flash[:danger] = @book.errors.full_messages
      redirect_to :action => 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:success] = "Book has been deleted"
      redirect_to :action => @books
    else
      flash[:danger] = "Error while deleting the book"
      redirect_to :action => 'show', :id => @book
    end
  end

  def show_subjects
    @subject = Subject.find(params[:id])
  end
end
