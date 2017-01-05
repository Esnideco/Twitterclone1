class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def new

    @user = User.new 
  end

  def create
    
    @user = User.new(:name => params[:user][:name], :email => params[:user][:email])
    if @user.save
      redirect_to users_path, :notice => "Your post was saved"
    else 
      render new, :notice => "there was an error creating the message"
    end 

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
    # user is the parent of email and user so we call it first then :email and :name
  	# redirect to index
  	redirect_to users_path
  end


end
