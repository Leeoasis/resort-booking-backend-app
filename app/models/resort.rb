class Resort < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :phone_number, presence: true, format: { with: /\A\+\d+\z/, message: "should be in the format '+1234567890'" }
  validates :email, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :available_rooms, presence: true, numericality: { only_integer: true }
  validates :max_occupancy, presence: true, numericality: { only_integer: true }
  validates :base_price, presence: true, numericality: { only_integer: true }
  validates :user_id, presence: true, numericality: { only_integer: true }
end
