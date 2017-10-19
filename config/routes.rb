Rails.application.routes.draw do
  root 'profiles#index'

  devise_for :users

  resources :activities
  
  resources :profiles do
    resources :conversations
  end

  resources :conversations do
    resources :messages
  end
end
