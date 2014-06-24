
require 'digest'


class User < ActiveRecord::Base
  attr_accessor :password

  attr_accessible :name, :email, :password, :password_confirmation,:role_id, :user_id,:username
   
  validates :name, :presence => true, 
                  :length => { :maximum => 50 }
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true,
                     :format => { :with => email_regex},
                     :uniqueness => { :case_sensitive => false }
  validates :username, :presence => true,
                       :uniqueness => {:case_sensitive => false}

  validates :password,  :confirmation => true

before_save :encrypt_password
before_create { generate_token(:auth_token) }

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end
def has_password?(submitted_password)
  encrypted_password == encrypt(submitted_password)
end
class << self
def authenticate(username, submitted_password)
user = find_by_username(username)
(user && user.has_password?(submitted_password)) ? user :nil

end
def authenticate_with_salt(id,cookie_salt)
  user = find_by_id(id)
  (user && user.salt == cookie_salt) ? user :nil
end 
end
private
def encrypt_password
self.salt = make_salt if new_record?
self.encrypted_password = encrypt(password)
end
def encrypt(string)
secure_hash("#{salt}--#{string}")
end
def make_salt
secure_hash("#{Time.now.utc}--#{password}")
end
def secure_hash(string)
Digest::SHA2.hexdigest(string)
end


end
