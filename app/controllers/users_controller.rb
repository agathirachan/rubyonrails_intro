class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update, :destroy]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] =@user.id
          flash[:notice] ="User was successfully added."
          redirect_to @user
        else
          render 'new'
        end
    end
    
    def edit
      
    end

    def update      
        if @user.update(user_params)
          flash[:notice] ="User was successfully updated."
          redirect_to @user
        else
          render 'edit'
        end
    end
    
    def show
      @articles= @user.articles.paginate(page: params[:page], per_page: 3)
    end

    def index
      @users= User.paginate(page: params[:page], per_page: 3)
    end

    def destroy
      @user.destroy()
      session[:user_id] = nil if current_user == @user 
      flash[:notice] ="Account and all associate articles successfully deleted"
      redirect_to articles_path
    end
  
     # anything below private is a private method
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    # byebug
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert]= "You can only edit/edit your user information"
      redirect_to @user
    end
end
end
