class ContactsController < ApplicationController
  def index
    @contact = Contact.new
    @contacts = current_user.contacts
    @reverse_contacts = current_user.reverse_contacts
    @incoming_contacts = @reverse_contacts.where(status: 101)
  end

  def pendings
    @contact = Contact.new
  end

  def create
    unless @contact = Contact.find_by_inviter_id_and_email(params[:contact][:inviter_id], params[:contact][:email])
      @contact = Contact.new(params[:contact])
      @contact.email = @contact.email.downcase
    end
    @invitee = User.find_by_email(@contact.email)
    if add_self?(@contact.email)
      flash[:error] = "Can't add yourself"
      redirect_to contacts_path    
    elsif add_connected_contact?(@invitee)
      flash[:notice] = "Contact exists"
      redirect_to contacts_path
    elsif add_existing_inviter?(@invitee)
      accept_original_invitation(@invitee)
      flash[:success] = "New contact connected"
      redirect_to contacts_path
    elsif add_existing_invitee?(@contact, @invitee)
      flash[:notice] = "Contact exists in pending list"
      redirect_to contacts_path
      send_invitation(@contact)
    elsif add_new_contact(@contact, @invitee)
      flash[:success] = "New contact added"
      redirect_to contacts_path
      send_invitation(@contact)
    else
      flash[:error] = @contact.errors.full_messages[0]
      redirect_to contacts_path
    end
  end

  def accept_signup_view
    @user = User.new
    @contact = Contact.find_by_token(params[:token])
    if @contact.nil?
      flash[:error] = "Ooops...The link has expired"
      redirect_to root_path
    elsif logged_in?
      if current_user.id == @contact.invitee_id
        set_contact_status(@contact, 201)
        flash[:success] = "Connected with " + @contact.inviter.name
        redirect_to contacts_path
      else
        log_out
        redirect_to accept_login_path + "?token=" + @contact.token unless @contact.invitee_id.blank?        
      end  
    else
      redirect_to accept_login_path + "?token=" + @contact.token unless @contact.invitee_id.blank?
    end
  end

  def accept_signup
    @user = User.new(params[:user])
    @contact = Contact.find_by_token(params[:page][:token])
    if @user.save
      fill_existing_contacts(@user)
      log_in(@user, params[:page][:stay])
      set_contact_status(@contact, 201)
      flash[:success] = "New contact connected"
      redirect_to contacts_path
    else
      flash[:error] = @user.errors.full_messages
      redirect_to accept_signup_path + "?token=" + @contact.token
    end
  end

  def accept_login_view
    @contact = Contact.find_by_token(params[:token])
    if @contact.nil?
      flash[:error] = "Ooops...The link has expired"
      redirect_to root_path
    end
  end

  def accept_login
    @user = User.find_by_email(params[:session][:email].downcase)
    @contact = Contact.find_by_token(params[:page][:token])
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user, params[:stay])
      set_contact_status(@contact, 201)
      flash[:success] = 'New contact connected'
      redirect_to contacts_path
    else
      flash[:error] = 'Invalid Email or Password'
      redirect_to accept_login_path + "?token=" + @contact.token
    end
  end

  def block
  end

  def unblock
  end
end