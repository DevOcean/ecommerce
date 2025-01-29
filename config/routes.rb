Rails.application.routes.draw do
  namespace :admin do
      resources :carts
      resources :cart_items
      resources :incompatibilities
      resources :parts
      resources :part_variants
      resources :products
      resources :product_part_variants
      resources :variants

      root to: "products#index"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :carts
  resources :cart_items
  resources :parts
  resources :variants
  resources :part_variants
  resources :products
  resources :product_part_variants
  resources :incompatibilities

  # Set Products index as the default homepage
  root "products#index"
end
