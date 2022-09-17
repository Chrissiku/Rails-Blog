require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create(name: 'Christian', photo: 'https://avatars.githubusercontent.com/u/101924220?s=40&v=4',
                     bio: 'Software Engineer', postsCounter: 0)
  post = Post.create(title: 'Rspec test', text: 'rspec test for post model', commentsCounter: 1, likesCounter: 0,
                     authorId: 1)
  like = Like.new(post_id: post.id, authorId: user.id)

  describe 'Tests for Like model validations' do
    it 'like should be valid' do
      expect(like).to be_valid
    end

    it 'Increases the value of likes_counter' do
      counter = Post.find(post.id).likesCounter
      like.update_counter
      expect(Post.find(post.id).likesCounter).to eq(counter + 1)
    end
  end
end
