module ApplicationHelper

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
    # Delayed jobs: SystemEmails.delay.invite(contact)
    SystemEmails.invite(contact).deliver
  end

  def fill_existing_contacts(user)
    Contact.where(email: user.email).update_all(invitee_id: user.id)
  end

  def set_contact_status(contact, status)
    contact.update_attribute(:status, status)
  end

  def get_connected_contacts(user)
    Contact.where("inviter_id = ? AND status >= ? ", user.id, 200).pluck(:invitee_id) + Contact.where("invitee_id = ? AND status >= ? ", user.id, 200).pluck(:inviter_id)
  end

  def get_new_contacts(user)
    contacts = user.contacts.where(status: 201).order("updated_at DESC")
  end

end
