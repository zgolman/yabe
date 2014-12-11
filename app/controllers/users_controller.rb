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



    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_url, notice: "Thank you for signing up!"
        else
            render "home"
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end


