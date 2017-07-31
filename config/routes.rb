Rails.application.routes.draw do
	root 'pictures#index'

  devise_for :users

 	get 'users/:id' => 'users#show', as: :user

 	resources :pictures, except: [:index] do
 		# get '/:title' => 'pictures#full', param: :title
 		post 'comments/create' => 'comments#create'
 	end


 	resources :tags, only: [:show], param: :slug

end
