class QuestionsVotes < ActiveRecord::Base
  attr_accessible :question_id, :upordown, :user_id
end