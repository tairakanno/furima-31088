Rails.application.routes.draw do
  root to: "items#index"
  resources :items do
    resources :orders, only:[:index]
  end
  devise_for :users
end
