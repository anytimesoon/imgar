Rails.application.routes.draw do
	root 'pictures#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: [:show] do
  	get 'pictures' => 'pictures#user_pictures', as: 'pictures'
  end

 	resources :pictures, except: [:index] do
 		post 'comments/create' => 'comments#create'
 		patch 'ratings/update' => 'ratings#update'
 	end


 	resources :tags, only: [:show], param: :slug

end
