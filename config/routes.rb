Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :songs, only: [:index, :show, :new, :create]
  resources :genres, only: [:index, :show]
  resources :artists, only: [:index, :show]
  resources :ratings, only: [:index]
end
