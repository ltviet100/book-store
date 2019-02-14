Rails.application.routes.draw do
  root 'books#index'

  get 'pages/about'

  resources :books

  resources :authors

  resources :categories

  resources :publishers

end
