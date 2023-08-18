class Resort < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }
  validates :email, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :available_rooms: true, numericality: {only_integer: true}
  validates :max_occupancy: true, numericality: {only_integer: true}
  validates :base_price: true, numericality: {only_integer: true}
  validates :user_id: true, numericality: {only_integer: true}
end
