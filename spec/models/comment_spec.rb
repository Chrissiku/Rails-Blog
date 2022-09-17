require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create(name: 'Christian', photo: 'https://avatars.githubusercontent.com/u/101924220?s=40&v=4',
                     bio: 'Software Engineer', postsCounter: 0)
  post = Post.create(title: 'Rspec test', text: 'rspec test for post model', commentsCounter: 1, likesCounter: 0,
                     authorId: user.id)
  comment = Comment.new(post_id: post.id, authorId: user.id, text: 'This is a test for comment model')

  describe 'Tests for Comment model validations' do
    it 'comment should be valid' do
      expect(comment).to be_valid
    end

    it 'Increases the comments_counter' do
      counter = Post.find(post.id).commentsCounter
      comment.update_counter
      expect(Post.find(post.id).commentsCounter).to eq(counter + 1)
    end
  end
end
