Rails.application.routes.draw do
  
  get "/" => "home#index"
  #get "todos", to: "todos#index"
  #post "todos/create", to: "todos#create"
  #get "todos/:id", to: "todos#show"
  resources :todos
  resources :users
  #post "users/login", to: "users#login"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
