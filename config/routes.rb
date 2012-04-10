Nfo::Application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy ]
  resources :users, only: [:show, :update]
  resources :articles

  root to: "articles#index"
  
  match '/login', to: "sessions#new", as: 'login'
  match '/logout', to: "sessions#destroy", as: 'logout', via: :delete
  match '/tagged/:value', to: "tags#posts_by_tag", as: 'tag'
  match '/edit_profile', to: "users#edit", as: 'profile'
  match '/archive', to: "articles#archive", as: 'archive'
      
  #TODO: Learn more about custom routing to make this proper
  #resources :personal_links, only [:edit, :create, :update, :destroy]
  match '/links', to: "personal_links#edit", as: 'links'
  match '/links/create', to: "personal_links#create", via: :put
  match '/links/update', to: "personal_links#update", via: :post
  match '/links/delete', to: "personal_links#destroy", via: :delete
end
