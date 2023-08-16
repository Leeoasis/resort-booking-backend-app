require 'rails_helper'

RSpec.describe Resort, type: :model do
  it { should have_many(:bookings) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:available_rooms) }
  it { should validate_numericality_of(:available_rooms).is_greater_than_or_equal_to(0) }
  it { should validate_presence_of(:max_occupancy) }
  it { should validate_numericality_of(:max_occupancy).is_greater_than_or_equal_to(0) }
  it { should validate_presence_of(:base_price) }
  it { should validate_numericality_of(:base_price).is_greater_than_or_equal_to(0) }
end
