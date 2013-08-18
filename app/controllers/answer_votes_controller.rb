class AnswerVotesController < ApplicationController

  def new

  end

  def create
    p params
    p "asterisk"
    @user = User.find(session[:id])
    @answer = Answer.find(params[:answer_vote][:answer_id])
    @question = @answer.question
    if @user.answer_votes.where(answer_id: @answer.id).count <= 0
      AnswerVote.create(user_id: @user.id, answer_id: @answer.id, upordown: params[:answer_vote][:upordown])
    # elsif
    end
    redirect_to @question
  end

end
