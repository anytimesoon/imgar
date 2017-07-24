Rails.application.routes.draw do
	root 'pictures#index'

  devise_for :users#, :controllers => { registrations: 'registrations' }

 	get 'users/:id' => 'users#show', as: :user

 	resources :pictures, except: [:index]
end
