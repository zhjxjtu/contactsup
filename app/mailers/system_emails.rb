class SystemEmails < ActionMailer::Base
  
  default from: "Focus Project Team <focustest.2012@gmail.com>"

  def invite(contact)
    @contact = contact
    mail to: @contact.email, from: @contact.inviter.name, subject: "My contact information"
  end

end
