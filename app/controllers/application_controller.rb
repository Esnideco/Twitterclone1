class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :current_user
	before_filter :require_login
	def hello
		render html: "hello, world!"
	end


	private

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	
	def require_login
		unless current_user
			redirect_to root_path, :notice => " Not logged in please log in!"

		end
	end
end
