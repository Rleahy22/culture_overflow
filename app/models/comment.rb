class Comment < ActiveRecord::Base
  attr_accessible :answer_id, :content, :user_id

  belongs_to :author, foreign_key: "user_id", class_name: "User"
  belongs_to :answer
  
end
