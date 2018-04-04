Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories
  devise_for :users

  resources :youtubers do
  	collection do
  		get 'search'
  	end
    member do
        put 'like' => "youtubers#upvote"
        put 'unlike' => "youtubers#downvote"
    end
  	resources :reviews, except: [:show, :index] do
      member do
        put 'like' => "reviews#upvote"
        put 'unlike' => "reviews#downvote"
      end
    end
  end

  root 'youtubers#index'  
  
end
