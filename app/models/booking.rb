class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :facility

  validates :start_time, presence: true
  validates :end_time, presence: true
end
