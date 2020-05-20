Rails.application.routes.draw do
  resources :todos
  resources :users
  post "users/login" => "users#login"
  get "/" => "home#index"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
