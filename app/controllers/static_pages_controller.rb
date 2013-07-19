class StaticPagesController < ApplicationController
  def login
    @user = User.verify(params)
    session[:id] = @user.id
    redirect_to root_path
  end

  def logout
    session[:id] = nil
    redirect_to root_path
  end
end
