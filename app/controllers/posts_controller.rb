class PostsController < ApplicationController
  def index

  	@posts = Post.all
  end

  
  def new
    @post = Post.new 
  end 

  def create

  	@post = Post.new(:title => params[:post][:title], :body => params[:post][:body], :user => current_user)
    if @post.save
      redirect_to posts_path, :notice => "Your post was saved"
    else 
      render new, :notice => "there was an error creating the message"
    end 

  end 

  def edit

    @post = Post.find(params[:id])

  end 

  def update
    @post =  Post.find(params[:id])
    @post.update(:title => params[:post][:title], :body => params[:post][:body])
    redirect_to posts_path 
  end 

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :notice => "The post was deleted"
  end 
end
