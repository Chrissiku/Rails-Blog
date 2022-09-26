Rails.application.routes.draw do
  root 'users#index'
  get 'users/index'
  get 'users/show'
  get 'posts/index'
  get 'posts/show'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :form, :create]
  end

  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

end
