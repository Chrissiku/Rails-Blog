require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'Return http success' do 
      get '/posts/index'
      expect(response).to have_http_status(:success)
    end

    it 'Should render the index template' do 
      get '/posts/index'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'Return http success' do
      get '/posts/show'
      expect(response).to have_http_status(:success)
    end

    it 'Should render the index template' do 
      get '/posts/show'
      expect(response).to render_template(:show)
    end
  end
end
