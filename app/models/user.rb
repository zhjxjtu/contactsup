class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, 
                  :token_s, :status, :token_u,
                  :name, :org, :title,
                  :email_pref, :email_work, :email_home, 
                  :tel_pref, :tel_cell, :tel_work, :tel_home
  has_secure_password

  has_many :contacts, foreign_key: "inviter_id", dependent: :destroy
  has_many :invitees, through: :contacts, source: :invitee
  has_many :reverse_contacts, foreign_key: "invitee_id", class_name: "Contact", dependent: :destroy
  has_many :inviters, through: :reverse_contacts, source: :inviter

  before_save :downcase_emails
  before_save :create_tokens

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :name, presence: true, length: { minimum: 2 }

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
