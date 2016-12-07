class User < ActiveRecord::Base
  has_many :things
  validates :username, uniqueness: true
end
