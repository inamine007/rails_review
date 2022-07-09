class User < ApplicationRecord
  has_secure_password

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
end
