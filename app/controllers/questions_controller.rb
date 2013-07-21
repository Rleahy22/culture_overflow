class QuestionsController < ApplicationController
  
  before_filter :find_question_by_id, only: [:edit, :update, :destroy, :show]
  before_filter :verify_authorship, only: [:edit, :update, :destroy]

  def index
    @questions = Question.all
  end
  
  def show
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
  end
  
  def update
    @question.update_attributes(params[:question])
    redirect_to @question
  end
  
  def destroy
    @question.destroy
    redirect_to root_url
  end

  def current_user
    @user ||= User.find_by_id(session[:id])
  end

  private

  def verify_authorship
    @question = Question.find_by_id(params[:id])
    unless current_user.id == @question.author.id
      redirect_to question_path
    end
  end

  def find_question_by_id
    @question = Question.find(params[:id])
  end

end
