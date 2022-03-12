require 'rails_helper'

RSpec.describe 'Users', type: :request do
  # let(:user) { create(:user) }
  # let(:params) do
  #   {
  #     user: {
  #       first_name: 'First', 
  #       last_name: 'Last', 
  #       email: 'sample@exmaple.com'
  #     }
  #   }
  # end

  context 'GET /index' do
    before do
      get '/users#index'
    end
    it 'renders and returns status code 200' do
      expect(response).to render_template(:index)
      expect(response).to have_http_status(:ok)
    end
  end

  context 'GET /show' do
    before do
      user = User.create!(first_name: 'First', last_name: 'Last', email: 'sample@exmaple.com')
      get "/users/#{user.id}"
    end
    it 'returns a success response' do
      expect(response).to render_template(:show)
      expect(response).to have_http_status(:ok)
    end
  end
end
