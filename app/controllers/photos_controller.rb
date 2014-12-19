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
      @user = User.find(params[:photo][:user_id])
      @user.photos << Photo.new(photo_params)
      # Attach this criterion to a decision
      if @user.save
        redirect_to auction_path(Photo.last.auction_id)
      else
        render 'new'
      end
    end
  
    def show

      @photo = Photo.find(params[:id])
    end

    def update
      @photo = Photo.find(params[:id])
      # raise @photo.inspect
      if @photo.update_attributes(params.permit(:winner_id))
        redirect_to auctions_path
      else
        render 'show'
      end
    end
    
  private
    def photo_params
      params.require(:photo).permit(:name, :image, :description, :auction_id, :winner_id)
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