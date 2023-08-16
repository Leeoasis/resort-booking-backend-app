class Resort < ApplicationRecord
  has_many :bookings

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :available_rooms, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :max_occupancy, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :base_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
