class LikesController < ApplicationController

  def index
    puts "!!!!!!!!!!!!!!!!!!!"
    puts "@@@@@@@ WE'RE IN THE INDEX @@@@@@@@"
    @likes = Like.all
    render :json => @likes

  end

  def show
    @like = Like.find(params[:id])
    render :json => @like
  end

	def create

	  @like = Like.new(:user => current_user, :post_id => params[:post_id])

    if @like.save
      render json: @like, status: :created
    else
      render json: @like.errors, status: :unprocessable_entity
    end
	end

  def destroy

   
    @like = Like.where(:user => current_user, :post_id => params[:id])
    
    @like.first.destroy

    render json: {:message => "deleted"}, status: 202

  end 
end
