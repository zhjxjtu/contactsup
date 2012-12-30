class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  	  log_in(user, params[:stay])
	    redirect_to contacts_path
	  else
	    flash.now[:error] = 'Invalid Email or Password'
	    render 'new'
	  end
  end

  def destroy
    log_out
    flash[:error] = 'You are now logged out'
    redirect_to login_path
  end
end
