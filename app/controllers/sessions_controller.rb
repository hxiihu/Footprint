class SessionsController < ApplicationController
  
  def login
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash.now[:success] = '亲爱的，Welcome back!'
      # Log the user in and redirect to the user's show page.
      log_in user
      #params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if params[:session][:remember_me] == '1'
        remember(user)
      else
        forget(user)
      end
      redirect_back_or user
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email address or password'
      render 'login'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
