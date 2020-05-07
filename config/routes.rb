Rails.application.routes.draw do
  resources :todos
  resources :users
  post "users/login" => "users#login"
  get "/" => "home#index"
end
