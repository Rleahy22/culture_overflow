class QuestionsController < ApplicationController
  # before_filter :current_user, only: [:edit, :update, :destroy]

  def index
    @questions = Question.all
  end
  
  def show
    @question = Question.find(params[:id])
    @answer = Answer.new()
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
    redirect_to @question
  end
  
  def edit
    @question = Question.find(params[:id])
  end
  
  def update
    p params
    p params[:id]
    p "******"
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    redirect_to @question
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_url
  end

end
