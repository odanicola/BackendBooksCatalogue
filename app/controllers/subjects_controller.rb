class SubjectsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:success] = "Subject has successfully been added"
      redirect_to :action => @subjects
    else
      flash[:danger] = @subject.errors.full_messages
      redirect_to :action => 'new'
    end
  end

  def subject_params
    params.require(:subject).permit(:nama,:description,:status)
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      flash[:success] = "Subject has been updated"
      redirect_to :action => 'show', :id => @subject
    else
      flash[:danger] = @subject.errors.full_messages
      redirect_to :action => 'edit'
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    if @subject.destroy
      flash[:success] = "Subject " + @subject.nama + " has been deleted"
      redirect_to :action => @subjects
    else
      flash[:danger] = "Error while deleting the subject"
      redirect_to :action => @subjects
    end
  end
end
