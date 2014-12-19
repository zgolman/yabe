class UsersController < ApplicationController
    
    skip_before_filter :authorize

    def index
        @users = User.all
        @user = User.new
    end

    # def new
    #     @user = User.new
    # end

    def home
        @user = User.new
    end

    def dashboard
        current_id = current_user[:id]
        @user= User.find_by id: current_id
        
        @auctions = @user.auctions
        @photos = @user.photos
        
        # @auctions = Auction.all
        @timeleft = []
        @auctions.each do |j|
        @timeleft.push({hours:((j.created_at.to_i) + (j.auction_period/1000) - Time.now.to_i)/60/60,
           minutes: (((j.created_at.to_i) + (j.auction_period/1000) - Time.now.to_i)/60%60),
           seconds: (((j.created_at.to_i) + (j.auction_period/1000) - Time.now.to_i)%60)})
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to option_path, notice: "Thank you for signing up!"
        else
            render "home"
        end
    end

    def option
        
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :user_id)
    end
end


