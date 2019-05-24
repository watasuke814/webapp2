Rails.application.routes.draw do
  get 'posts/index'
  post 'posts/create'
  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
