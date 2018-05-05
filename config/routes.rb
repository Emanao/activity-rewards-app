Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html    
  #root
  root "static_pages#home"
  
  #signup
  get "/signup" => "users#new"
  post '/users' => "users#create"
  
  #login
  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#logout"
  
  #github login
  get '/auth/:provider/callback' => 'sessions#create'

  #nested resources
  resources :users, only: [:show] do
    resources :activities, only: [:index, :update]
    resources :achievements, only: [:index, :update]
  end 

  #Admin resources
  resources :activities, only: [:index, :edit, :update]
  resources :users, only: [ :index, :edit, :update]
end
