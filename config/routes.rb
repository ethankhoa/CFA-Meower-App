Rails.application.routes.draw do


  resources :profiles, only: [:edit]
  resources :posts
  devise_for :users
  root 'pages#index'

  get 'pages/profile'

  get 'pages/feed'

  get 'pages/admin'

  get 'profiles/edit'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
