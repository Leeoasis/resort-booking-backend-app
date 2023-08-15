Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :bookings, only: [:index, :show, :create, :update, :destroy]
      resources :resorts
    end
  end
end

