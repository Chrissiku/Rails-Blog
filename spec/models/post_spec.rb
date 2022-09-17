require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Christian', photo: 'https://avatars.githubusercontent.com/u/101924220?s=40&v=4',
                     bio: 'Software Engineer', postsCounter: 0)
  post = Post.new(title: 'Rspec test', text: 'rspec test for post model', commentsCounter: 1, likesCounter: 0,
                  authorId: user.id)

  describe 'Tests for Post model validations' do
    it 'CommentsCounter & LikesCounter test' do
      expect(post).to be_valid
    end

    it 'most be integer and zero or more' do
      post.commentsCounter = 0
      post.likesCounter = 'two'
      expect(post).to_not be_valid
    end

    it 'validation for title length' do
      post.title = 'b' * 252
      expect(post).to_not be_valid
    end

    it 'Increases the posts_counter' do
      counter = User.find(user.id).postsCounter
      post.update_counter
      expect(User.find(user.id).postsCounter).to eq(counter + 1)
    end
  end
end
