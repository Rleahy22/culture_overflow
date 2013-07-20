class AnswerVote < ActiveRecord::Base
  attr_accessible :answer_id, :upordown, :user_id 

  validates_uniqueness_of :user_id, scope: :answer_id

  belongs_to :user
  belongs_to :answer
end
