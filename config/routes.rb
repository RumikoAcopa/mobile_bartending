Rails.application.routes.draw do
  resources :drink_orders
  resources :drinks do 
    resources :drink_orders, only: [:index, :new]
  end 
  
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'} 
    
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "drinks#index"
end
