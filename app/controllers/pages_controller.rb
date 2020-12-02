class PagesController < ApplicationController
    # home action for Pages controller
    def home
        redirect_to articles_path if logged_in?
    end
    def about
    end
end
