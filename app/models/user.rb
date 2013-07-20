require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  attr_accessible :email, :username, :password_hash

  has_many :answers
  has_many :questions
  has_many :comments
  has_one :question_vote
  has_one :answer_vote

  validates :email, uniqueness: true
  validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/i

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.create(params)
    @user = User.new(params)
    @user.password = params[:password]
    @user.save!
    @user
  end

  def self.verify(params)
    @user = User.find_by_email(params[:email])
    @user.password == params[:password] ? @user : nil
  end
end
