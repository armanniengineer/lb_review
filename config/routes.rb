Rails.application.routes.draw do
  devise_for :users

  resources :youtubers do
  	resources :reviews, except: [:show, :index]
  end

  root 'youtubers#index'  
  
end
