require 'swagger_helper'

RSpec.describe 'api/v1/resorts', type: :request do
  path '/api/v1/resorts' do
    get('list resorts') do
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

    path '/api/v1/resorts' do
      post 'Create a resort' do
        consumes 'application/json'
        parameter name: :resort, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            address: { type: :string },
            image_url: { type: :string },
            description: { type: :string },
            phone_number: { type: :string },
            email: { type: :string },
            city: { type: :string },
            country: { type: :string },
            available_rooms: { type: :integer },
            max_occupancy: { type: :integer },
            base_price: { type: :string },
            user_id: { type: :integer }
          },
          required: ['name', 'address', 'image_url', 'description', 'phone_number', 'email', 'city', 'country', 'available_rooms', 'max_occupancy', 'base_price', 'user_id']
        }
        response '200', 'resort created' do
          run_test!
        end
      end
    end
  end

  path '/api/v1/resorts/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show resort') do
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

    path '/api/v1/resorts/{id}' do
      patch 'Update a resort' do
        consumes 'application/json'
        produces 'application/json'
        parameter name: :id, in: :path, type: :integer
        parameter name: :resort, in: :body, schema: {
          type: :object,
          properties: {
            name: { type: :string },
            address: { type: :string },
            image_url: { type: :string },
            description: { type: :string },
            phone_number: { type: :string },
            email: { type: :string },
            city: { type: :string },
            country: { type: :string },
            available_rooms: { type: :integer },
            max_occupancy: { type: :integer },
            base_price: { type: :string },
            user_id: { type: :integer }
          }
        }
    
        response '200', 'resort updated' do
          run_test!
        end
    
        response '404', 'resort not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    path '/api/v1/resorts/{id}' do
      delete 'Delete a resort' do
        produces 'application/json'
        parameter name: :id, in: :path, type: :integer
    
        response '204', 'resort deleted' do
          run_test!
        end
    
        response '404', 'resort not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end
  end
end
