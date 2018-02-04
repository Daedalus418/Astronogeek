class Idea < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :votes

  scope :hottest, -> { order(hot_score: :desc) }
  scope :newest, -> { order(created_at: :desc) }

  validates :title,
            presence: true,
            uniqueness: true
            
  validates :description,
            length: { minimum: 0 },
            allow_blank: true

  validates :user_id,
            presence: true

  def comment_count
    comments.length
  end

  def upvotes
    votes.sum(:upvote)
  end

  def calc_hot_score
    points = upvotes
    score = points

    update_attributes(points: points, hot_score: points)
  end

  private

end
