Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'welcome#index'
  
  resources :users do
    resources :activities

  resources :admin, only: [:index]
  end
 end
