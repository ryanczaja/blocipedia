Blocipedia::Application.routes.draw do


	devise_for :users, controllers: {registrations: 'devise/registrations'}
	resources :users, only: [:show]

  resources :wikis do
  	resources :collaborators, :except => [:index, :show]
  end
  resources :charges

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
  
end
