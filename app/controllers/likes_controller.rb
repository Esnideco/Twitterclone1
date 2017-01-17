class LikesController < ApplicationController

  def index
    @likes = Like.all
    respond_to do |format|
      format.json { render :json => @likes, :include => :user }
    end
  end

  def show
    @like = Like.find(params[:id])
    respond_to do |format|
      format.json { render :json => @like, :include => :user }
    end
  end

	def create
    puts params
	  @like = Like.new(:user => current_user, :post_id => params[:like][:post])

    respond_to do |format|
      if @like.save
        format.json { render json: @like, status: :created}
      else
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
	end
end
