class AnswerVote < ActiveRecord::Base
  attr_accessible :answer_id, :user_id

  validates :user_id, uniqueness: true, scope: :answer_id

  belongs_to :user
  belongs_to :answer
end
