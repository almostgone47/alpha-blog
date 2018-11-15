require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  context 'GET #index' do
    it 'returns categories index' do
      get :index
      expect(response).to be_successful # response.success?
    end
  end
  
  context 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
  end

  context 'GET #show' do
    it 'returns a success response' do
      category = Category.create!(category_name: 'sports')
      get :show, params: { id: category.to_param }
      expect(response).to be_successful
    end
  end
end