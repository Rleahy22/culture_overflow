class CommentsController < ApplicationController

  before_filter :current_user, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.create(params[:comment])
    User.find(session[:id]).comments << @comment
    @answer = Answer.find(params[:comment][:answer_id]).comments << @comment
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
    @comment = Comment.new(content: "default")
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
