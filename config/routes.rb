Rails.application.routes.draw do
  resources :posts , only: [:index,:create] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:create,:show,:edit,:update] 
  post 'login', to: 'users#login'
  post 'logout', to: 'users#logout'
  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

