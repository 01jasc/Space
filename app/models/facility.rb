class Facility < ApplicationRecord
  has_many :users, through: :bookings
  has_many :bookings
  has_many :ratings
  belongs_to :category
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
