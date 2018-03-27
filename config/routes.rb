Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories
  devise_for :users

  resources :youtubers do
  	collection do
  		get 'search'
  	end
  	resources :reviews, except: [:show, :index] do
      member do
        get 'like'
      end
    end
  end

  root 'youtubers#index'  
  
end
