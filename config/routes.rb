Rails.application.routes.draw do
  resources :brands
  resources :categories
  root to: "products#index"
  resources :products do
    collection { post :search, to: "products#index"}
  end
end
