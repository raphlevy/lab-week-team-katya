require 'bcrypt'
require 'byebug'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  validates_presence_of :email
  validates_confirmation_of :password
  validates_uniqueness_of :email

  property :id, Serial
  property :email, String, required: true
  property :password_digest, Text
  property :password_token, Text
  property :name, Text

  has n, :tasks

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
