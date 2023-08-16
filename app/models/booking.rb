class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :resort

  validates :user_id, presence: true
  validates :resort_id, presence: true
  validates :selected_date, presence: true
  validates :selected_city, presence: true, length: { maximum: 255 }
end
