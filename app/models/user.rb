class User < ApplicationRecord
	attr_accessor :password

  has_many :posts
  has_many :likes

 

  has_many :liked_posts, :through => :likes, :source => :post

  before_save :encrypt_password

  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create

  def self.authenticate(email, password)
    user = find_by(:email => email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
  	if password.present?
  		self.password_salt = BCrypt::Engine.generate_salt
  		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  	end
  end
end
