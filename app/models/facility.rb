class Facility < ApplicationRecord

  CATEGORIES = ["Gym", "Boulder", "Climbing", "Swimming", "MMA", "Volleyball", "Badminton", "Tennis", "Kajaking"]
  has_many :users, through: :bookings
  has_many :bookings
  has_many :ratings
  belongs_to :category

end
