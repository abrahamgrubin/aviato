Aviato::Application.routes.draw do
 
 resources :hashtags, only: [:show, :index, :destroy]

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  resources :bookmarks

  authenticated :user do 
  	root to: 'bookmarks#index', as: 'authenticated_user'
  end

  root to: 'welcome#index'
  resources :bookmarks

  get 'hashtags/:hashtag', to:'bookmark#index', as: :hashtag

end
