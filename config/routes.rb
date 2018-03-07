Rails.application.routes.draw do
  resources :categories
  devise_for :users

  resources :youtubers do
  	collection do
  		get 'search'
  	end
  	resources :reviews, except: [:show, :index]
  end

  root 'youtubers#index'  
  
end
