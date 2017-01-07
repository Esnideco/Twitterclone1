Rails.application.routes.draw do

 

	resources :posts 

	root 'sessions#new'
	resources :users

	resources :sessions , only:[:new , :create]

get "log_out" => "sessions#destroy", :as => "sign_out"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
