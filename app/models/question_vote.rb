class QuestionVote < ActiveRecord::Base
  attr_accessible :question_id, :upordown, :user_id

  validates_uniqueness_of :user_id, scope: :question_id

  belongs_to :user
  belongs_to :question
end
