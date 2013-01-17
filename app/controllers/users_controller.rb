class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      fill_existing_contacts(@user)
      log_in(@user, params[:page][:stay])
      flash[:success] = "Welcome to ContactsUp!"
      redirect_to contacts_path
    else
      flash.now[:error] = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    @user = current_user
    update_without_password(@user, params[:user])
    flash[:success] = "Profile updated"
    log_in(@user, "yes")
    redirect_to contacts_path
  end

  def destroy
  end

  def forgot_password
    @user = User.find_by_email(params[:user][:email])
    if !@user.nil?
      flash[:success] = "An reset email sent to #{params[:user][:email]}"
      SystemEmails.delay.reset(@user)
      #SystemEmails.reset(@user).deliver
    else
      flash[:error] = "Invalid or wrong email"
    end
    redirect_to login_path
  end

  def update_password
  end

  def reset_password_view
    unless @user = User.find_by_token_u(params[:token])
      flash[:error] = "Ooops...The link has expired"
      redirect_to root_path
    end
  end

  def reset_password
    @user = User.find_by_token_u(params[:user][:token_u])
    if @user.update_attributes(params[:user])
      flash[:success] = "Log in with new password"
      redirect_to login_path
    else
      flash[:error] = @user.errors.full_messages[0]
      redirect_to reset_password_path + "?account_token=#{@user.account_token}"
    end
  end

end
