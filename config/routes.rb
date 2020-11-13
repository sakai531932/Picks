Rails.application.routes.draw do
  get 'profiles/new'
  get 'sessions/new'
  root 'pages#index'
  
  resources :users
  resources :profiles
  resources :messages
  resources :rooms
  resources :purchases
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
