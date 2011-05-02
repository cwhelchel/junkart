require 'digest/sha2'

class User < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  
  validates     :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader   :password
  
  validate :password_must_be_present

  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "junk" + salt)
  end
  
  def User.authenticate(name, password)
    if user = find_by_name(name)
      if user.hased_password == encrypt_password(password, user.salt)
        user
      end
    end
  end
  
  def password=(password)
    @password = password
    
    if password.present?
      generate_salt
      self.hased_password = self.class.encrypt_password(password, salt)
    end
  end
  
  private
    def password_must_be_present
      errors.add(:password, "Missing Password") unless hased_password.present?
    end
    
    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
end