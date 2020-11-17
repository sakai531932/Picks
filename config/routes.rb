Rails.application.routes.draw do
  resources :rooms, only: [:show, :create] do
    member do
      post :entries, :messages
    end
  end
  get 'profiles/new'
  get 'sessions/new'
  root 'pages#index'
  
  resources :users
  resources :profiles
  
  resources :messages
  resources :entries
  resources :purchases
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  put 'users/follow/:user_id' => 'users#follow'
  get 'users/follow_list/:user_id' => 'users#follow_list'
  get 'users/follower_list/:user_id' => 'users#follower_list'
end
