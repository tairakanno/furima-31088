Rails.application.routes.draw do
  resources :items,  only: [:new]
  devise_for :users
end
