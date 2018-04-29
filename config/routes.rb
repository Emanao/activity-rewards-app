Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html    
  root "static_pages#home"
  get "/signup" => "users#new"
  post '/users' => "users#create"
  resources :users, only: [:show]
  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#logout"
  get '/auth/:provider/callback' => 'sessions#create'

end
