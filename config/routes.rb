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
  resources :users
  resources :songs, only: [:index, :show, :new, :create]
  resources :genres, only: [:index, :show]
  resources :artists, only: [:index, :show]
  resources :ratings, only: [:index, :show, :new, :create]
  
end
