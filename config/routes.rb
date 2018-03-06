Rails.application.routes.draw do


  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  root 'welcome#index'

  get 'welcome/index'
  resources :articles do
    resources :comments
  end
  resources :tags
  resources :users
  resources :user_sessions, only: [:new, :create, :destroy]
  get 'login' =>'user_sessions#new'
  get 'logout' =>'user_sessions#destroy'
  get 'signup' =>'users#new'
  get 'messages/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
