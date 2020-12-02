class ApplicationController < ActionController::Base
      # hello is a action method
    # def hello
    #    render html:'Hello world'
    # end
    # this makes current user both helper method accessible in views and contorller
    helper_method :current_user, :logged_in?
    def current_user
      # if @current_user is empty populate current user from database else use from the cahce
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
          
    end

    def logged_in?
      # convert @current_user into boolean by using !!
      # if current user has value return true else return false
      !!current_user 
    end

    def require_user
        if !logged_in?
          flash[:alert]= "You must be logged in to perform that action"
          redirect_to login_path
        end
    end
end
