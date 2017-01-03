class User < ApplicationRecord

	has_many :posts
	def self.authenticate(email)
    user = find_by(:email => email)
    if user
      user
    else
      nil
    end
  end
end
