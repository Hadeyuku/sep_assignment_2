Rails.application.routes.draw do
  get '/search' => 'search#search'
  devise_for :users
  root 'home#top'
  get 'home/about'
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end
end