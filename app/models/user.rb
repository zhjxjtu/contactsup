class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, 
                  :token_s, :status, :token_u,
                  :name, :org, :title, :email_pref, :tel_pref
  has_secure_password

  before_save :downcase_emails
  before_save :create_tokens

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :name, presence: true, length: { minimum: 2 }
  validates :email_pref, format: { with: VALID_EMAIL_REGEX }

  private

    def downcase_emails
  	  self.email = email.downcase
  	  self.email_pref = self.email
    end

    def create_tokens
  	  self.token_s = SecureRandom.urlsafe_base64
      self.token_u = SecureRandom.urlsafe_base64
    end

end
