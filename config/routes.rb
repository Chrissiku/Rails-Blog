Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'posts/index'
  get 'posts/show'
  root 'users#index'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :form, :create]
  end

  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

end
