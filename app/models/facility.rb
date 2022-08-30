class Facility < ApplicationRecord
  has_many :users, through: :bookings
  has_many :bookings
  has_many :ratings
end
