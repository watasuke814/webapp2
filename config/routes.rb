Rails.application.routes.draw do
  resources :posts, only: [:index,:create]
  resource :users, only: [:create,:edit] 
  post 'users/login'
  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
