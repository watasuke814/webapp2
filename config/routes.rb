Rails.application.routes.draw do
  resources :posts, only: [:index,:create]
  resource :users, only: [:create,:edit] 
  post 'login', to: 'users#login'
  post 'logout', to: 'users#logout'
  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

