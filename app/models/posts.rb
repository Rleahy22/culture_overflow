class Posts < ActiveRecord::Base
  attr_accessible :content, :title, :url, :user_id
end
