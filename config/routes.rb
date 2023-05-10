Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post 'login', to: 'sessions#create'

  resources :auctions, only: [:create]
  resources :autobids, only: [:create, :destroy]
  resources :items, only: [:index]
end
