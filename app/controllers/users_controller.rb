class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          flash[:notice] ="User was successfully added."
          redirect_to articles_path
        else
          render 'new'
        end
    end
     # anything below private is a private method
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    # byebug
    @user = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
