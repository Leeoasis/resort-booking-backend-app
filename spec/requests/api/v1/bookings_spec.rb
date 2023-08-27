require 'swagger_helper'

RSpec.describe Api::V1::BookingsController, type: :controller do
  let(:user) { User.create(email: 'john@example.com', password: '123456') }
  let(:resort) do
    Resort.create(name: 'Resort Name', address: '123 Main St.', description: 'A beautiful resort',
                  phone_number: 1_234_567_890, email: 'resort@example.com', country: 'USA',
                  city: 'New York', available_rooms: 10, max_occupancy: 20,
                  base_price: 100, user_id: user.id)
  end
  let(:valid_attributes) do
    { reservation_date: Date.today, returning_date: Date.today + 1.week, selected_city: 'New York', user_id: user.id,
      resort_id: resort.id }
  end

  let(:invalid_attributes) do
    { reservation_date: nil, returning_date: nil, selected_city: nil, user_id: nil, resort_id: nil }
  end

  describe 'GET #index' do
    it 'returns a success response' do
      Booking.create! valid_attributes
      get :index, format: :json
      expect(response).to be_successful
    end

    it 'returns all bookings' do
      Booking.create! valid_attributes
      Booking.create! valid_attributes
      get :index, format: :json
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      booking = Booking.create! valid_attributes
      get :show, params: { id: booking.to_param }, format: :json
      expect(response).to be_successful
    end

    it 'returns the correct booking' do
      booking = Booking.create! valid_attributes
      get :show, params: { id: booking.to_param }, format: :json
      expect(JSON.parse(response.body)['id']).to eq(booking.id)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Booking' do
        expect do
          post :create, params: { booking: valid_attributes }, format: :json
        end.to change(Booking, :count).by(1)
      end

      it 'renders a JSON response with the new booking' do
        post :create, params: { booking: valid_attributes }, format: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end
end
