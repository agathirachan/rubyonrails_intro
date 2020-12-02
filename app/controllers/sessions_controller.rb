class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] =user.id
            flash[:notice] ="Logged in scucessfully"
            redirect_to user
        else
            # displays as it happens and dissapers, does not wait for one full cycle
            flash.now[:alert] = "There was something wrong with your login details"
            render "new"
        end

    end
    
    def destroy
      session[:user_id] = nil
      flash[:notice] ="Logged Out"
      redirect_to root_path
    end

end
