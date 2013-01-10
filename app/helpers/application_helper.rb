module ApplicationHelper

# Users related --------------------

  def update_without_password(user, params)
    user.update_attribute(:name, params[:name])
    user.update_attribute(:org, params[:org])
    user.update_attribute(:title, params[:title])
    user.update_attribute(:email_pref, params[:email_pref])
    user.update_attribute(:email_work, params[:email_work])
    user.update_attribute(:email_home, params[:email_home])
    user.update_attribute(:tel_pref, params[:tel_pref])
    user.update_attribute(:tel_cell, params[:tel_cell])
    user.update_attribute(:tel_work, params[:tel_work])
    user.update_attribute(:tel_home, params[:tel_home])
  end

# Sessions related --------------------

  def log_in(user, stay)
  	if stay == "yes"
  	  cookies.permanent[:token_s] = user.token_s
  	else
  	  cookies[:token_s] = user.token_s
  	end
  	self.current_user = user
  end

  def current_user=(user)
  	@current_user = user
  end

  def current_user
  	@current_user ||= User.find_by_token_s(cookies[:token_s])
  end

  def log_out
    self.current_user = nil
    cookies.delete(:token_s)
  end

  def logged_in?
    !current_user.nil?
  end

# Contacts related --------------------

  def add_self?(email)
    email == current_user.email
  end

  def add_connected_contact?(invitee)
    if invitee
      Contact.where("inviter_id = ? AND invitee_id = ? AND status >= ?", current_user.id, invitee.id, 200).exists? || Contact.where("inviter_id = ? AND invitee_id = ? AND status >= ?", invitee.id, current_user.id, 200).exists?
    end
  end

  def add_existing_inviter?(inviter)
    if inviter
      current_user.inviters.exists?(inviter)
    end
  end

  def accept_original_invitation(inviter)
    contact = Contact.find_by_inviter_id_and_invitee_id(inviter.id, current_user.id)
    set_contact_status(contact, 201)
  end

  def add_existing_invitee?(contact, invitee)
    if invitee
      current_user.invitees.exists?(invitee)
    else
      current_user.contacts.exists?(email: contact.email)
    end
  end

  def add_new_contact(contact, invitee)
    contact.invitee_id = invitee.id unless !invitee
    contact.save
  end

  def send_invitation(contact)
    SystemEmails.delay.invite(contact)
    # No Delayed jobs: SystemEmails.invite(contact).deliver
  end

  def fill_existing_contacts(user)
    Contact.where(email: user.email).update_all(invitee_id: user.id)
  end

  def set_contact_status(contact, status)
    contact.update_attribute(:status, status)
  end

end
