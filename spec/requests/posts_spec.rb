require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'Victor', photo: 'https://avatars.githubusercontent.com/u/67344757?v=4', bio: 'test for User')
      get user_posts_path(@user)
    end

    it 'Check if response status was correct' do
      expect(response).to have_http_status(:success)
    end

    it 'Check if a correct template was rendered' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    before(:each) do
      @user = User.create(name: 'Christian', photo: 'https://avatars.githubusercontent.com/u/101924220?v=4', bio: 'test for User')
      @post = Post.create(user: @user, title: 'test', text: 'A test post')
      # @post = Post.create(title: 'test', text: 'A test post')
      get user_posts_path(@user, @post)
    end

    it 'Check if response status was correct' do
      expect(response).to have_http_status(:success)
    end

    # it 'Check if a correct template was rendered' do
    #   expect(response).to render_template(:show)
    # end
  end
end
