class UsersController < ApplicationController
  #Log in to have access
  #Profile is only accessble to user himself
  before_action :logged_in_user, only: [:edit, :update, :show, :index]
   before_action :correct_user,   only: [:edit, :update, :show]

  def signup
  	 @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    #flash[:success] = "Welcome Back!"
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save # .save method returns true/false upon the success/failure of writing to database
      log_in @user
      flash[:success] = "当你低头的一瞬间，才发觉脚下的路。嗨，Welcome to Footprint!"
      redirect_to user_url(@user) # Handle a successful save.
    else
      render 'signup' # render "./signup" page again upon the failure of arributes tests
    end
  end

  # create 'edit' action
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

   private	#private method
 	def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "You need to log in to view the profile."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
