class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def pendings
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.email = @contact.email.downcase
    invitee = User.find_by_email(@contact.email)
    if add_self?(@contact.email)
      flash[:error] = "You can't add yourself"
      redirect_to contacts_path    
    elsif add_existing_contact?(invitee)
      flash[:notice] = "Contact exists"
      redirect_to contacts_path
    elsif add_existing_inviter?(invitee)
      #accept_original_invitation(contact)
      flash[:success] = "New contact connected"    
    elsif add_existing_invitee?(@contact, invitee)
      flash[:notice] = "Contact exists in pending list"
      redirect_to pendings_path
      send_invitation(@contact)    
    elsif add_new_contact(@contact, invitee)
      flash[:success] = "New contact added"
      redirect_to pendings_path
      send_invitation(@contact)
    else
      flash[:error] = @contact.errors.full_messages[0]
      redirect_to pendings_path
    end
  end

  def accept_signup_view
  end

  def accept_signup
  end

  def accept_login_view
  end

  def accept_login
  end

  def block
  end

  def unblock
  end
end
