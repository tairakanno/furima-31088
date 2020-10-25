Rails.application.routes.draw do
  root to: "items#index"
  resources :items,  only: [:new, :create, :index, :show]
  devise_for :users
end
