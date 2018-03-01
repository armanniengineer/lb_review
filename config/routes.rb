Rails.application.routes.draw do
  devise_for :users
  resources :youtubers
  root 'youtubers#index'  
end
