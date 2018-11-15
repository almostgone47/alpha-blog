require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  context 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful # response.success?
    end
  end

  context 'GET #show' do
    it 'returns a success response' do
      user = User.create!(user_name: 'username', email: 'first.last@example.com', password: 'password')
      get :show, params: { id: user.to_param }
      expect(response).to be_successful
    end
  end
end
