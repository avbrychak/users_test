Rails.application.routes.draw do
  get 'static_pages/home'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "static_pages#home"
  resources :users, only: [ :index, :new, :create ]
  resources :sessions, only: [ :new, :create, :destroy ]
end
