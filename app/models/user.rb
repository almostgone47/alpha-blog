class User < ActiveRecord::Base
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.email = email.downcase }
  validates :email, presence: true, uniqueness: true, length: { minimum: 4, maximum: 50 }, format: { with: VALID_EMAIL }
  validates :password, presence: true, length: { minimum: 4, maximum: 20 }
  has_many :articles
end