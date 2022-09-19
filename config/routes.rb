Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # root 'users#index'
  get 'users/index'
  get 'users/show'
  get 'posts/index'
  get 'posts/show'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
end
