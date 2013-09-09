require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :email, :name, :passwd

  # Depict that this is the parent to another child table
  has_many :expenses

  # Add basic validations to be done on the data
  validates :email, :presence => true, :length => { :minimum => 5, :maximum => 50 }, :uniqueness => true
  validates :name, :presence => true, :length => { :maximum => 50 }
  validates :passwd, :presence => true

  # As we dont want to save passwords as plain text,
  # lets hash them up and save them in the database
  # TODO - Fix this method
  # ISSUE - User is able to create account with out password when this
  # method is enabled.
  #def passwd=(pwd)
  #  logger.debug("Hashing the password... #{pwd}")
  #  write_attribute(:passwd, BCrypt::Password.create(pwd))
  #end

  def self.authenticate(email, pwd)
    user = User.where(:email => email).limit(1)

    if ! user.nil?
      if BCrypt::Password.new(@passwd).is_password? pwd
        # Passwords have matched now. So return the user object.
        return user
      end
    else
      logger.debug("User with email: #{email} not found in database.")
    end

    # No user in DB (or) invalid password.
    return nil
  end
end
