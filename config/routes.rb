Rails.application.routes.draw do
  resources :items,  only: [:new, :create]
  devise_for :users
end
