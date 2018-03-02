Rails.application.routes.draw do
  resources :reviews
  devise_for :users
  resources :youtubers
  root 'youtubers#index'  
end
