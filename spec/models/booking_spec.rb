require 'rails_helper'

RSpec.describe Booking, type: :model do
  it { should belong_to(:resort) }

  it { should validate_presence_of(:customer_name) }
  it { should validate_presence_of(:contact_information) }
  it { should validate_presence_of(:reservation_date) }
  it { should validate_presence_of(:duration) }
  it { should validate_numericality_of(:duration).is_greater_than(0) }
  it { should validate_presence_of(:num_guests) }
  it { should validate_numericality_of(:num_guests).is_greater_than(0) }
end
