class SessionsController < ApplicationController
  
  def login
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #flash[:success] = '亲爱的，Welcome back!'
      # Log the user in and redirect to the user's show page.
      if user.activated?
        log_in user
        #params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        if params[:session][:remember_me] == '1'
          remember(user)
        else
          forget(user)
        end
        redirect_back_or user
      else
        message  = "Sorry! Account not activated. Check your email for the activation link."
        flash[:danger] = message
        redirect_to root_url
      end
    else
      # Create an error message.
      flash.now[:danger] = 'Sorry! Invalid Email Address or Password.'
      render 'login'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
