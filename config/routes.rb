Rails.application.routes.draw do
  get 'private/test'
  devise_for :users, 
    path: '', 
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

    namespace :api do
      namespace :v1 do
        resources :bookings, only: %i[index show create update destroy]
        resources :resorts
      end
    end
end