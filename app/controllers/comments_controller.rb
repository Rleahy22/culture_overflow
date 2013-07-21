class CommentsController < ApplicationController

  before_filter :current_user, only: [:edit, :update, :destroy]

  def create
    p params
    p "HIIII"
    @comment = Comment.create(params[:comment])
    User.find(session[:user_id]).comments << @comment
    p @comment
    @answer = Answer.find(params[:comment][:answer_id])
    @answer.comments << @comment
    redirect_to @comment.answer.question
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_url
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def new
    p "Saturday *****"
    p params
    @comment = Comment.create()
    redirect_to @question
  end
    
  def show
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    redirect_to root_path
  end

end
