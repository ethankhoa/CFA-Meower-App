Rails.application.routes.draw do
  resources :posts do
    member do
      get 'toggle_follow', to: 'posts#toggle_follow'
      get 'toggle_like', to: 'posts#toggle_like'
    end
  end


  authenticated :user do
    root 'pages#feed', as: :authenticated_root
    end

    root "pages#index"

  resources :profiles, only: [:edit]
  devise_for :users


  get 'pages/profile'

  get 'pages/feed'

  get 'pages/admin'

  get 'profiles/edit'

  get 'posts/index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
