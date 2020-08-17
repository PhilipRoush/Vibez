Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :songs, only: [:index, :show, :new, :create]
  resources :genres, only: [:index]
  resources :artists, only: [:index]
  resources :ratings, only: [:index]
end
