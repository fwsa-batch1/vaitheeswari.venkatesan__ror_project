Rails.application.routes.draw do
  # get "todos", to: "todos#index"
  # post "todos", to: "todos#create"
  # patch "todos/:id", to: "todos#update"
  # get "todos/:id", to: "todos#show"
  get "/" => "home#index"
  resources :todos
  post "users/login", to: "users#login"
  resources :users
  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
end
