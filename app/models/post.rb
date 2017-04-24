class Post < ApplicationRecord
  has_many :comments, { dependent: :destroy }
  belongs_to :category
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  def liked_by?(user)
    likes.exists?(user: user)
  end

  def like_for(user)
    likes.find_by(user: user)
  end

end
