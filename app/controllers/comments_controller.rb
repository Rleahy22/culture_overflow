class CommentsController < ApplicationController

  before_filter :current_user, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.create(params[:comment])
    User.find(session[:user_id]).comments << @comment
    redirect_to @comment
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
    if current_user
      @comment = Comment.new()
    else
      redirect '/'
    end
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
