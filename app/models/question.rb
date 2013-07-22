class Question < ActiveRecord::Base

  include QuestionsHelper
  
  attr_accessible :content, :title, :user_id

  has_many :answers
  has_many :question_votes
  belongs_to :author, foreign_key: "user_id", class_name: "User"

end
