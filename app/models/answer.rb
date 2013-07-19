class Answer < ActiveRecord::Base
  attr_accessible :content, :question_id, :user_id

  belongs_to :user
  belongs_to :question
  has_many :comments
  has_many :answer_votes
    
end
