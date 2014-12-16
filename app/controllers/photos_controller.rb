  class PhotosController < ApplicationController
    def index
      @photos = Photo.all
    end
    def new
      @photo = Photo.new
    end
    def create
      # Find our parent decision that we should attach to
      # @photo = current_user.photos.new(photo_params)
      @photo = Photo.new(photo_params)
      # Attach this criterion to a decision
      if @photo.save
        redirect_to auctions_path
      else
        render 'new'
      end
    end
  
    def show
      @photo = Photo.find(params[:id])
    end
  
    def photo_params
      params.require(:photo).permit(:name, :image, :description, :auction_id)
    end
  end

    # @user = current_user
    # joke = Joke.find(params[:joke_id])
    # comment = UserComment.new(:description => params[:description])
    # comment.user_id = @user.id
    # joke.user_comments << comment
    # # raise params.inspect
    # if joke.save
    #   redirect_to joke_path(params[:joke_id])
    # else
    #   render 'new'
    # end