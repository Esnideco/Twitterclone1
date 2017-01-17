Rails.application.routes.draw do

 
	resources :posts do
		get 'search', on: :collection
	end

	root 'sessions#new'
	resources :users

	resources :sessions , only:[:new , :create]

	get "log_out" => "sessions#destroy", :as => "sign_out"

	resources :likes , only:[:create, :index, :show]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
