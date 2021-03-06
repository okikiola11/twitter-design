Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: 'users#show'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :followings, only: [:create, :destroy]
  resources :opinions do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, except: [:new] 
  
  root 'opinions#index'
end
