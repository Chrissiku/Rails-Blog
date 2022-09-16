require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(Name: 'Developer', Photo: 'https://avatars.githubusercontent.com/u/101924220?v=4', Bio: 'Software developer',
                     PostsCounter: 0)
  post = Post.create(Title: 'Rspec test', Text: 'rspec test for post model', CommentsCounter: 1, LikesCounter: 0,
                     authorId: 1)
  like = Like.new(post_id: post.id, authorId: user.id)

  describe 'Tests for Like model validations' do
    it 'like should be valid' do
      expect(like).to be_valid
    end

    it 'Increases the likes_counter' do
      counter = Post.find(post.id).LikesCounter
      like.update_counter
      expect(Post.find(post.id).LikesCounter).to eq(counter + 1)
    end
  end
end