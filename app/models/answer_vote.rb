class AnswerVote < ActiveRecord::Base
  attr_accessible :answer_id, :user_id

  validates :user_id, uniqueness: true

  belongs_to :user
  belongs_to :answer
end
