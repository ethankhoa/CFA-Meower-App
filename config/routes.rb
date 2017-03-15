Rails.application.routes.draw do
  root 'pages#feed'

  get 'pages/profile'

  get 'pages/admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
