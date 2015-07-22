class UsersController < ApplicationController
  def signup
  	 @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save # .save method returns true/false upon the success/failure of writing to database
      flash[:success] = "当你低头的一瞬间，才发觉脚下的路。亲爱的，Welcome to Footprint!"
      redirect_to user_url(@user) # Handle a successful save.
    else
      render 'signup' # render "./signup" page again upon the failure of arributes tests
    end
  end

   private	#private method
 	def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end

  def login
  end
end
