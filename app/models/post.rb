class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'authorId'
  has_many :comments, class_name: 'Comment', foreign_key: 'authorId'
  has_many :likes, class_name: 'Like', foreign_key: 'authorId'

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_counter

  def update_counter
    user.increment!(:postsCounter)
  end

  def recent_comment
    comments.order(created_at: :desc).limit(5)
  end
end

# Create post.
# first_post = Post.create(Author: user, Title: 'Hello', Text: 'This is my first post')
