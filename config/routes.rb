Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :assets, only: [:create, :update]
      post '/login', to: 'auth#create'
      # '/login' verifies user and sends a jwt, token and @user
      get '/profile', to: 'users#profile'
    end
  end
end


# ROUTES:
# /api/v1/users [create]
# /api/v1/login [auth]
# /api/v1/profile [persistent-auth]
