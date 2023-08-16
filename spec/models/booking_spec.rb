require 'rails_helper'

RSpec.describe Booking, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:resort) }
  
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:resort_id) }
  it { should validate_presence_of(:selected_date) }
  it { should validate_presence_of(:selected_city) }
  it { should validate_length_of(:selected_city).is_at_most(255) }
end
