class QuestionsController < ApplicationController
  before_filter :check_login, only: [:edit, :update, :destroy]

  def index
    @questions = Question.all
  end
  
  def show
    @question = Question.find(params[:id])
  end
  
  def new

  end

  def create
    @question = Question.create(params[:question])
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

  private

  def check_login
    @question = current_user.questions.find_by_id(params[:id])
    if @question.nil?
      redirect_to root_url
    end
  end
end
