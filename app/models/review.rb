class Review < ApplicationRecord

  validates :title, presence: true, length: { minimum: 1, maximum: 50 }
  validates :content, presence: true

  belongs_to :user
end
