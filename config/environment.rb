# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Contactsup::Application.initialize!

Contactsup::Application.configure do
  
  # Mailer configuration 
  
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "gmail.com",
    authentication: "plain",
    user_name: "info@contactsup.com",
    password: "info@contactsup",
    enable_starttls_auto: true
  }

end

ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "gmail.com",
  authentication: "plain",
  user_name: "info@contactsup.com",
  password: "info@contactsup",
  enable_starttls_auto: true
}