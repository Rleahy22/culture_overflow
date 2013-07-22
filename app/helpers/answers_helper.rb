module AnswersHelper 

  def votecount
    answer_votes.where(upordown: 1).count - answer_votes.where(upordown: -1).count
  end

  def <=>(other)
    self.votecount<=>other.votecount
  end

end