Rails.application.routes.draw do
  resources :profiles
  devise_for :users
 root "home#index"
 
end
