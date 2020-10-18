Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: 'users#show'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :followings, only: [:create, :destroy]
  resources :opinions
  resources :users, only: [:index, :show] 
  
  root 'opinions#index'
end
