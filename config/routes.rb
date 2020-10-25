Rails.application.routes.draw do
  root to: "items#index"
  resources :items,  only: [:new, :create, :index]
  devise_for :users
end
