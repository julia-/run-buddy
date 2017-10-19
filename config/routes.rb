Rails.application.routes.draw do
  root 'profiles#index'

  devise_for :users
  resources :messages
  resources :conversations
  resources :activities
  resources :profiles
end
