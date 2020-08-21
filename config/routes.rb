Rails.application.routes.draw do
  get '/' => 'sessions#welcome', as: 'welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  delete '/logout' => 'sessions#destroy'
  get '/profile/:id' => 'users#profile', as: 'profile'
  get '/artists/top10' => 'artists#top10'
  get '/songs/top10' => 'songs#top10'
  get '/song/:id/rate' => 'ratings#new', as: 'new_rating'
  resources :users
  resources :songs, only: [:index, :show, :new, :create, :edit, :update]
  resources :genres, only: [:index, :show]
  resources :artists, only: [:index, :show]
  resources :ratings, only: [:index, :show, :create]
  
end
