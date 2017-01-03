class User < ActiveRecord::Base
  has_many :things
  validates :username, uniqueness: true
  has_secure_password

  # def password
  #   @password ||= BCrypt::Password.new(password_hash)
  # end
  #
  # def password=(new_password)
  #   @password = BCrypt::Password.create(new_password)
  #   self.password_hash = @password
  # end
end
