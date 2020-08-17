Rails.application.routes.draw do
  resources :users, only: [:index]
  resources :songs, only: [:index]
  resources :genres, only: [:index]
  resources :artists, only: [:index]
  resources :ratings, only: [:index]
end
