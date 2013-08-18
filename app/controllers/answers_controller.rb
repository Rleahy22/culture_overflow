class AnswersController < ApplicationController

  def edit
  end

  def show
  end

  def update
  end

  def new
    @answer = Answer.create(params[:answer])
    redirect_to @question
  end

  def create
    @answer = Answer.create(params[:answer])
    User.find(session[:id]).answers << @answer
    @question = Question.find(params[:answer][:question_id])
    @question.answers << @answer
    redirect_to @question
  end

  def destroy
  end

end
