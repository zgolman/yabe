class AuctionsController < ApplicationController
  def index
    @auctions = Auction.all
    @timeleft = []
    if @auctions!=nil
      @auctions.each do |j|
        @timeleft.push({hours:((j.created_at.to_i) + (j.auction_period/1000) - Time.now.to_i)/60/60,
         minutes: (((j.created_at.to_i) + (j.auction_period/1000) - Time.now.to_i)/60%60),
         seconds: (((j.created_at.to_i) + (j.auction_period/1000) - Time.now.to_i)%60)})
      end
    end

  end

  def new
    @auction = Auction.new
  end

  def create
    @user = current_user
    
    @auction = Auction.new(auction_params)
    @auction.user_id = @user.id
    
    respond_to do |format|

    if @auction.save
            

            session[:user_id] = @user.id
            format.html { redirect_to @auction, notice: 'User was successfully created.' }
            format.json { render action: 'show', status: :created, location: @auction }
          else
            format.html { render action: 'new' }
            format.json { render json: @auction.errors, status: :unprocessable_entity }
          end
    end
end



  def show
    @auction = Auction.find(params[:id])

  
    @auction.save
    @list = Photo.all 

    @timeleft = @auction.created_at.to_i - @auction.auction_period.to_i

    
    @photo = Photo.new
    @photos = @auction.photos

    @current_user = current_user
    # @auctionPhotos = Photo.where(auction_id: @auction.id)
    # @photo.save


  end

  def update
    @auction = auction.find(params[:id])
    raise params.inspect
    if @auction.update_attributes(params.require(:auction).permit(auction_params))
      redirect_to auction_path
    else
      render 'show'
    end
  end

  def destroy
    @auction = auction.find(params[:id])
    @auction.destroy
    redirect_to auctions_path
  end


private
    # Never trust parameters from the scary internet, only allow the white list through.
    def auction_params
      params.require(:auction).permit(:amount, :auction_period, :category, :user_id)
    end
    
end
  
