Blocipedia::Application.routes.draw do

	get "wikis/index"

	devise_for :users	

  resources :wikis
  resources :charges

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
  
end
