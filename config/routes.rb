Rails.application.routes.draw do
  devise_for :admins, except: :create
  devise_for :users

  namespace :admin do
    root to: "admin#dashboard"
  end

  root to: "products#index"
  resources :products do
    collection { post :search, to: "products#index" }
  end
end
