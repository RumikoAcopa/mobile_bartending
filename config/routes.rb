Rails.application.routes.draw do
  resources :drink_orders
  resources :drinks 
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "drinks#index"
end
