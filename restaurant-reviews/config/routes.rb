Rails.application.routes.draw do

  devise_for :users
  resources :restaurants, only: [:index, :edit, :new, :show, :create, :update, :destroy] do
    resources :reviews, only: [:index, :new, :show, :create]
  end
  resources :reviews, only: [:index, :new, :show, :create]

  resources :categories, only: [:index, :show]

  root 'restaurants#index'
end
