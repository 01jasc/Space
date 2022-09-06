class Review < ApplicationRecord
  belongs_to :user
  belongs_to :facility

  validates :content, presence: true
  validates :rating, presence: true
end
