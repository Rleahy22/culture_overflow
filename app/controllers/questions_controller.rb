class QuestionsController < ApplicationController
  before_filter current_user, only: [:edit, :update, :destroy]

  def index
    @questions = Question.all
  end
  
  def show
    @question = Question.find(params[:id])
  end
  
  def new
    if current_user
      @question = Question.new()
    else
      redirect '/'
    end
  end

  def create
    @question = Question.create(params[:question])
    User.find(session[:user_id]).questions << @question
  end
  
  def edit
  end
  
  def update
    @question.update_attributes(params[:question])
  end
  
  def destroy
    @question.destroy
    redirect_to root_url
  end

end
