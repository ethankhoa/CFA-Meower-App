Rails.application.routes.draw do
  resources :posts do
    member do
      get 'toggle_follow', to: 'posts#toggle_follow'
      get 'toggle_like', to: 'posts#toggle_like'
    end
  end



  resources :profiles, only: [:edit]
  devise_for :users
  root 'pages#index'

  get 'pages/profile'

  get 'pages/feed'

  get 'pages/admin'

  get 'profiles/edit'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
