Rails.application.routes.draw do
  resources :messages
  resources :conversations
  resources :activities
  resources :profiles
  devise_for :users
 root "home#index"
 
end
