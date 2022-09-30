class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :posts, class_name: 'Post', foreign_key: 'authorId'
  has_many :comments, class_name: 'Comment', foreign_key: 'authorId'
  has_many :likes, class_name: 'Like', foreign_key: 'authorId'

  validates :name, presence: true
  validates :postsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def admin?
    :role == 'admin'
  end

  def recent_post
    posts.order(created_at: :desc).limit(3)
  end

  def all_posts
    posts.order(created_at: :desc)
  end
end
