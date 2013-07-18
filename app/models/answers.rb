class Answers < ActiveRecord::Base
  attr_accessible :content, :question_id, :user_id
end
