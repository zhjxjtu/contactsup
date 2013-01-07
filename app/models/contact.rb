class Contact < ActiveRecord::Base
  attr_accessible :inviter_id, :invitee_id, :email, :status,
      			  :token, :name, :tel, :org

  belongs_to :inviter, class_name: "User"
  belongs_to :invitee, class_name: "User"

  before_save :downcase_email
  before_save :create_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :inviter_id, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
  private

    def downcase_email
  	  self.email = email.downcase
    end

    def create_token
  	  self.token = SecureRandom.urlsafe_base64
    end

end
