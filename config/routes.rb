Rails.application.routes.draw do
	root 'pictures#index'
  devise_for :users
  resource :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
