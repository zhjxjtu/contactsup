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

  def show
  end

  def update
  end

  def destroy
  end

  def forgot_password
  end

  def update_password
  end

  def reset_password
  end

  def reset_password_view
  end
end
