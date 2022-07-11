class User < ApplicationRecord
  has_secure_password
  has_one_attached :icon

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true

  
  has_many :reviews
  has_many :favorites
end
