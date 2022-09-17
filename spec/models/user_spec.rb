require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: 'Christian', photo: 'https://avatars.githubusercontent.com/u/101924220?s=40&v=4',
                     bio: 'Software Engineer', postsCounter: 1)

  describe 'Tests for User model validations' do
    it 'is a valid user' do
      expect(user).to be_valid
    end

    it 'is valid ' do
      user.postsCounter = 1
      expect(user).to be_valid
    end

    it 'is a valid name' do
      expect(user.name).to eq('Christian')
    end

    it 'is a valid bio' do
      expect(user.bio).to eq('Software Engineer')
    end

    it 'is invalid without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end
  end
end
