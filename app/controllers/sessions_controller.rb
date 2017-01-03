class SessionsController < ApplicationController
	skip_before_filter :require_login

	def new
	end


	def create
		user = User.authenticate(params[:email])
		if user
			session[:user_id] = user.id
			redirect_to users_path, :notice => "Logged in!"
		else
			flash.now.alert = "Invalid email"
			render "new"
		end

	end

	def destroy
session[:user_id] = nil
redirect_to root_url, :notice => "Logged out!"
	end 
end