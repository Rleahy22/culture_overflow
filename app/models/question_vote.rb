class QuestionVote < ActiveRecord::Base
  attr_accessible :question_id, :upordown, :user_id

  validates :user_id, uniqueness: true

  belongs_to :user
  belongs_to :question
end
