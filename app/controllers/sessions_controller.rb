class SessionsController < ApplicationController
      # skip_before_filter :authorize


      def new
      end

      def create
        user = User.where(email: params[:email]).first
        # first make sure we actually find a user
        # then see if user authenticates
        if user && user.authenticate(params[:password])
            # sets the cookie to the browser
            session[:user_id] = user.id
            redirect_to root_url, notice: "Logged in!"
        else
            flash.now.alert = "Email or password is invalid"
            render "new"
            # redirect_to new_session_path
        end
      end


      def show

      end

      def destroy
        # Kill our cookies!
        reset_session
        redirect_to root_path, notice: "Logged out!"
      end
end 
