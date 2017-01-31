Rails.application.routes.draw do

 
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	resources :posts do
		get 'search', on: :collection
	end

	root 'sessions#new'
	resources :users

	resources :sessions , only:[:new , :create]

	get "log_out" => "sessions#destroy", :as => "sign_out"

	get "contact" => "application#contact", :as => "contact"

	resources :likes , only:[:create, :index, :show, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
