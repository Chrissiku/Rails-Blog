class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'authorId'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_save :update_counter

  def update_counter
    post.increment!(:commentsCounter)
  end
end

# Create comment
# Comment.create(Post: first_post, Author: second_user, Text: 'Hi Tom!' )#
