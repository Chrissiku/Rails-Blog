# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: 'Christian', photo: 'https://avatars.githubusercontent.com/u/101924220?s=40&v=4',
                     bio: 'Software Engineer')

  describe 'Tests for User model validations' do
    it 'is valid ' do
      user.postsCounter = 1
      expect(user).to be_valid
    end

    it 'is invalid' do
      expect(user).to_not be_valid
    end

    it 'is invalid without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end
  end
end
