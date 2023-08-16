require 'rails_helper'

RSpec.describe Api::V1::ResortsController, type: :controller do
  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    # Add more tests for index action if needed
  end

  describe 'POST create' do
    let(:valid_attributes) do
      { resort: { name: 'Resort Name', address: '123 Main Street', description: 'A beautiful resort...', phone_number: '123-456-7890', email: 'info@example.com', city: 'City Name', country: 'Country Name', available_rooms: 100, max_occupancy: 2, base_price: 150.00 } }
    end

    context 'with valid attributes' do
      it 'creates a new resort' do
        expect do
          post :create, params: valid_attributes
        end.to change(Resort, :count).by(1)
      end

      it 'returns a created response' do
        post :create, params: valid_attributes
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new resort' do
        expect do
          post :create, params: { resort: { name: nil, address: nil } }
        end.to_not change(Resort, :count)
      end

      it 'returns an unprocessable entity response' do
        post :create, params: { resort: { name: nil, address: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  # Add similar tests for show, update, and destroy actions
end
