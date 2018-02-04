class User < ApplicationRecord

  has_secure_password
  has_many :ideas, dependent: :destroy
  has_many :comments
  has_many :votes

  validates :username,
            presence: true,
            length: { minimum: 3 },
            uniqueness: true
            
  validates :email,
            presence: true,
            format: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
            
  validates :password,
            length: { minimum: 6 },
            confirmation: true

  validates :password_confirmation,
            presence: true

  def owns_comment?(comment)
    self == comment.user
  end

  def upvote(idea)
    votes.create(upvote: 1, idea: idea)
  end

  def upvoted?(idea)
    votes.exists?(upvote: 1, idea: idea)
  end

  def remove_vote(idea)
    votes.find_by(idea: idea).destroy
  end
            
end
