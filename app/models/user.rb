class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'authorId'
  has_many :comments, class_name: 'Comment', foreign_key: 'authorId'
  has_many :likes, class_name: 'Like', foreign_key: 'authorId'

  validates :Name, presence: true
  validates :PostsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
