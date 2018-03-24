Rails.application.routes.draw do
  # resources :restaurants, only: [:index, :edit, :new, :show, :create, :update, :destroy] do
  #   resources :reviews, only: [:index, :new, :show, :create]
  # end
  # resources :reviews, only: [:index, :new, :show, :create]

  root 'restaurants#index'
end
