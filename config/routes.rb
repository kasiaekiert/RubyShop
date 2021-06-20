Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :brands
  resources :categories
  root to: "products#index"
  resources :products do
    collection { post :search, to: "products#index" }
  end
end
