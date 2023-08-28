require 'swagger_helper'

RSpec.describe 'api/v1/bookings', type: :request do
  path '/api/v1/bookings' do
    get('list bookings') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    path '/api/v1/bookings' do
      post 'Create a booking' do
        consumes 'application/json'
        parameter name: :booking, in: :body, schema: {
          type: :object,
          properties: {
            selected_city: { type: :string },
            returning_date: { type: :date },
            reservation_date: { type: :date },
            user_id: { type: :integer },
            resort_id: { type: :integer }
          },
          required: ['booking_id', 'user_id', 'reservation_date', 'returning_date', 'selected_city']
        }
        response '200', 'booking created' do
          run_test!
        end
      end
    end
  end

  path '/api/v1/bookings/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show booking') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    path '/api/v1/bookings/{id}' do
      patch 'Update a booking' do
        consumes 'application/json'
        produces 'application/json'
        parameter name: :id, in: :path, type: :integer
        parameter name: :booking, in: :body, schema: {
          type: :object,
          properties: {
            selected_city: { type: :string },
            returning_date: { type: :date },
            reservation_date: { type: :date },
            user_id: { type: :integer },
            resort_id: { type: :integer }
          }
        }
    
        response '200', 'booking updated' do
          run_test!
        end
    
        response '404', 'booking not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    path '/api/v1/bookings/{id}' do
      delete 'Delete a booking' do
        produces 'application/json'
        parameter name: :id, in: :path, type: :integer
    
        response '204', 'booking deleted' do
          run_test!
        end
    
        response '404', 'booking not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end
  end
end
