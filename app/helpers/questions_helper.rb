module QuestionsHelper 

  def votecount
    question_votes.where(upordown: 1).count - question_votes.where(upordown: -1).count
  end

  def <=>(other)
    self.votecount<=>other.votecount
  end
  
end