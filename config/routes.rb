Rails.application.routes.draw do
	root 'pictures#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show] do
  	get 'pictures' => 'pictures#user_pictures', as: 'pictures'
  	get 'pictures/new'=> 'pictures#new'
  end

 	get 'pictures/top' => 'pictures#top'

 	resources :pictures, except: [:index, :new] do
 		post 'comments/create' => 'comments#create'
 		patch 'ratings/update' => 'ratings#update'
 	end


 	resources :tags, only: [:show], param: :slug

end
