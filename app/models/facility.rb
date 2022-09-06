class Facility < ApplicationRecord
  has_many :users, through: :bookings
  has_many :bookings
  has_many :reviews
  belongs_to :category
  
end
