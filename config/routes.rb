Rails.application.routes.draw do

  devise_for :users
  resources :users do
  	member do
  		get :following, :followers
  	end
  end
  resources :relationships, only: [:create, :destroy]
  resources :posts do
  	member do
  		put 'like' => 'posts#vote'
  	end
  end

  root 'pages#index'
  get '/home' => 'pages#home'
  get '/user/:id' => 'pages#profile'
  get '/explore' => 'pages#explore'
  post '/home' => 'pages#search'
  get '/help' => 'pages#help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
