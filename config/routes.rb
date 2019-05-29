Rails.application.routes.draw do
  resources :users, only: [:show,:create] 

  post 'posts/create'
  get 'posts/index'

  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
