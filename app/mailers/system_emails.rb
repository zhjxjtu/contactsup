class SystemEmails < ActionMailer::Base
  
  default from: "Focus Project Team <focustest.2012@gmail.com>"

  def invite(contact)
    @contact = contact
    mail to: @contact.email, from: @contact.inviter.name, subject: "Hi, may I have your contact information please?"
  end

end
