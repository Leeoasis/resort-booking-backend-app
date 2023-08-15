class Booking < ApplicationRecord
  belongs_to :resort

  validates :customer_name, presence: true
  validates :contact_information, presence: true
  validates :reservation_date, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :num_guests, presence: true, numericality: { greater_than: 0 }
end
