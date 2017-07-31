Rails.application.routes.draw do
	root 'pictures#index'


  resources :users, only: [:show] do
  	get 'pictures' => 'pictures#user_pictures', as: 'pictures'
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


 	resources :pictures, except: [:index] do
 		post 'comments/create' => 'comments#create'
 	end


 	resources :tags, only: [:show], param: :slug

end
