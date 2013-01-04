class SystemEmails < ActionMailer::Base

  def invite(contact)
    @contact = contact
    mail to: @contact.email, from: @contact.inviter.name, subject: "#{@contact.inviter.name}'s contact information"
  end

end
