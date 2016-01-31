Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'activities#index'
  resources :activities
  
 end
