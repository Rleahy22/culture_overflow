module QuestionsHelper 

  def verify_authorship
     unless current_user.id == Question.find_by_id(params[:id]).author.id
      redirect_to @question
     end
  end

end