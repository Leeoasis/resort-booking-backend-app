require 'rails_helper'

RSpec.describe Api::V1::ResortsController, type: :controller do
  let(:user) { User.create(email: 'john@example.com', password: '123456') }
  let(:valid_attributes) do
    { name: 'Resort Name', address: '123 Main St.', description: 'A beautiful resort', phone_number: 1_234_567_890,
      email: 'resort@example.com', country: 'USA', city: 'New York', available_rooms: 10, max_occupancy: 20,
      base_price: 100, user_id: user.id }
  end

  let(:invalid_attributes) do
    { name: nil, address: nil, description: nil, phone_number: nil, email: nil, country: nil, city: nil,
      available_rooms: nil, max_occupancy: nil, base_price: nil, user_id: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Resort.create! valid_attributes
      get :index, format: :json
      expect(response).to be_successful
    end

    it 'returns all resorts' do
      Resort.create! valid_attributes
      Resort.create! valid_attributes
      get :index, format: :json
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Resort' do
        expect do
          post :create, params: { resort: valid_attributes }, format: :json
        end.to change(Resort, :count).by(1)
      end

      it 'renders a JSON response with the new resort' do
        post :create, params: { resort: valid_attributes }, format: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new resort' do
        post :create, params: { resort: invalid_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to include('name', 'address', 'description', 'phone_number', 'email',
                                                     'country', 'city', 'available_rooms', 'max_occupancy',
                                                     'base_price', 'user_id')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { name: 'New Resort Name' }
      end

      it 'updates the requested resort' do
        resort = Resort.create! valid_attributes
        put :update, params: { id: resort.to_param, resort: new_attributes }, format: :json
        resort.reload
        expect(resort.name).to eq('Resort Name')
      end

      it 'renders a JSON response with the updated resort' do
        resort = Resort.create! valid_attributes
        put :update, params: { id: resort.to_param, resort: valid_attributes }, format: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the resort' do
        resort = Resort.create! valid_attributes
        put :update, params: { id: resort.to_param, resort: invalid_attributes }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to include('name', 'address', 'description', 'phone_number', 'email',
                                                     'country', 'city', 'available_rooms', 'max_occupancy',
                                                     'base_price', 'user_id')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested resort' do
      resort = Resort.create! valid_attributes
      expect do
        delete :destroy, params: { id: resort.to_param }, format: :json
      end.to change(Resort, :count).by(-1)
    end

    it 'returns a JSON response with no content' do
      resort = Resort.create! valid_attributes
      delete :destroy, params: { id: resort.to_param }, format: :json
      expect(response).to have_http_status(:no_content)
    end
  end
end
