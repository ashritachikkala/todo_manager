Rails.application.routes.draw do
  resources :users
  #get "todos", to: "todos#index"
  #post "todos/create", to: "todos#create"
  #get "todos/:id", to: "todos#show"

  resources :todos
  resources :users
  post "users/login", to: "users#login"
end
