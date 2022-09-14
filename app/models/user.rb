class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'AuthorId'
  has_many :comments, class_name: 'Comment', foreign_key: 'AuthorId'
  has_many :likes, class_name: 'Like', foreign_key: 'AuthorId'

  def recent_post
    posts.order(create_at: :desc).limit(3)
  end
end

# Create User
# user = User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')
