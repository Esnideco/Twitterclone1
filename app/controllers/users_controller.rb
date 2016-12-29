class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
	@user = User.find(params[:id])
  end 

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	# save the user
  	@user.update(:name => params[:user][:name], :email => params[:user][:email])
  	# redirect to index
  	redirect_to users_path
  end
end
