Rails.application.routes.draw do
  devise_for :users
  
  devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end

  root 'users#index'


  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :new, :form, :create]
  end


  resources :posts do
    resources :comments, only: [:create]
    resources :likes, only: [:create]
  end

end
