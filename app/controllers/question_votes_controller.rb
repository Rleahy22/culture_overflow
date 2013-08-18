class QuestionVotesController < ApplicationController

  def create
    p params
    p "asterisk"
    @user = User.find(session[:id])
    @question = Question.find(params[:question_vote][:question_id])
    if @user.question_votes.where(question_id: @question.id).count <= 0
      QuestionVote.create(user_id: @user.id, question_id: @question.id, upordown: params[:question_vote][:upordown])
    # elsif
    end
    redirect_to @question
  end

  def index
    redirect_to '/'
  end

end
