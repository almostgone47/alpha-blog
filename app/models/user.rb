class User < ActiveRecord::Base
  validates :email, presence: true, length: { minimum: 4, maximum: 50 }
  validates :password, presence: true, length: { minimum: 4, maximum: 20 }
end