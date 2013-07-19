class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
      
  end
  
  def create
    @user = User.create(params[:user])
    redirect_to root_path
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
  end

  def destroy
    @user = find(params[:id])
    if @session[:user] == @user.id
      @user.destroy
    end
    redirect_to root_path
  end
end
