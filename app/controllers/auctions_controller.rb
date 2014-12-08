class AuctionsController < ApplicationController
	
	   skip_before_filter :authorize

    def index
        @auctions = Auction.all
    end

    def new
        @auction = Auction.new
    end

    def create
        @auction = Auction.new(user_params)
        if @auction.save
            session[:user_id] = @user.id
            redirect_to auctions_path, notice: "Thank you for signing up!"
        else
            render "new"
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
