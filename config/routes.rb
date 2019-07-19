Rails.application.routes.draw do
  
  resources :posts , only: [:index,:create] do
    resource :favorites, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:create,:show,:edit,:update]
  get 'users/:id/posts', to: 'users#posts'
  get 'users/:id/favorites', to: 'users#favorites' 

  post 'login', to: 'users#login'
  post 'logout', to: 'users#logout'
  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

