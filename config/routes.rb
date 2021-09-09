Rails.application.routes.draw do
  devise_for :admin, except: :create
  devise_for :users

  namespace :admin do
    resources :products

    root to: "admin#dashboard"
  end

  resources :products

  root to: "products#index"
end
