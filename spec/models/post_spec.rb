require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(Name: 'Developer', Photo: 'https://avatars.githubusercontent.com/u/101924220?v=4',
                     Bio: 'Software developer', PostsCounter: 0)
  post = Post.new(Title: 'Rspec test', Text: 'rspec test for post model', CommentsCounter: 1, LikesCounter: 0,
                  authorId: user.id)

  describe 'Tests for Post model validations' do
    it 'CommentsCounter & LikesCounter test' do
      expect(post).to be_valid
    end

    it 'most be integer and zero or more' do
      post.CommentsCounter = 0
      post.LikesCounter = 'two'
      expect(post).to_not be_valid
    end

    it 'validation for title length' do
      post.Title = 'b' * 251
      expect(post).to_not be_valid
    end

    it 'Increases the posts_counter' do
      counter = User.find(user.id).PostsCounter
      post.update_counter
      expect(User.find(user.id).PostsCounter).to eq(counter + 1)
    end
  end
end
