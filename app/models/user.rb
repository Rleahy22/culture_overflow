class User < ActiveRecord::Base
  attr_accessible :email, :password_hash, :username

  has_many :answers
  has_many :questions
  has_many :comments
  has_one :question_vote
  has_one :answer_vote

  validates :email, uniqueness: true
  validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/i
end
