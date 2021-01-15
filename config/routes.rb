Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  get 'search' => 'users#search', :as => 'search_page'
  resources :users, only: [:show] do member do
  	patch 'follow'
  	patch 'unfollow'
  end
end

  resources :posts do member do
  	patch 'like_posts'
  	patch 'dislike_posts'
  end
  	resources :comments
  end
end
