Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :posts, only: [:new, :create, :show, :destroy] do
    resources :likes
    resources :comments
  end
  resources :comments do
    resources :comments
  end
  get 'search' => 'search#index'
end
