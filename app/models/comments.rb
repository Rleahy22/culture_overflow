class Comments < ActiveRecord::Base
  attr_accessible :answer_id, :content, :user_id
end
