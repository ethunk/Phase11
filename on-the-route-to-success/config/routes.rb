Rails.application.routes.draw do
  resources :horses
  resources :cars
  resources :trains
  resources :airplanes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
