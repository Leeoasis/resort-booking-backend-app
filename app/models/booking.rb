class Booking < ApplicationRecord
  belongs_to :resort
  belongs_to :user

  # validations
  validates :selected_date, presence: true
  validates :selected_city, presence: true
  validates :resort_id, presence: true
  validates :user_id, presence: true
end
