class UsersController < ApplicationController
  #Log in to have access
  #Profile is only accessble to user himself
  before_action :logged_in_user, only: [:edit, :update, :show, :index, :destroy]
  before_action :correct_user,   only: [:edit, :update, :show]
  before_action :admin_user,     only: :destroy #only Admin can delete a user

  def signup
  	 @user = User.new
  end

  def index
    #@users = User.all
    @users = User.paginate(page: params[:page])
  end

  def show
    #flash[:success] = "Welcome Back!"
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], :per_page => 11)
  end

  def create
    @user = User.new(user_params)
    if @user.save # .save method returns true/false upon the success/failure of writing to database
      # b4r authentication system
      # log_in @user
      # flash[:success] = "当你低头的一瞬间，才发觉脚下的路。Hi, #{user.name}，Welcome to Footprint!"
      # redirect_to user_url(@user) # Handle a successful save.
      @user.send_activation_email
      flash[:danger] = "Please check your email to activate your account. Check the spam if necessary. "
      redirect_to root_url
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


  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted"
    redirect_to users_url
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

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
