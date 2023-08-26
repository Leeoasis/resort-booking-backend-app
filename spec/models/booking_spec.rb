require 'rails_helper'

RSpec.describe Booking, type: :model do

  describe "validations" do

    it "is valid with valid attributes" do
        user = User.create(email: 'john@example.com', password: '123456')
        resort = Resort.create(name: "Resort Name", address: "123 Main St.", description: "A beautiful resort", phone_number: 1234567890, email: "resort@example.com", country: "USA", city: "New York", available_rooms: 10, max_occupancy: 20, base_price: 100, user_id: user.id)
        subject = user.bookings.build(selected_city: "New York", user_id: user.id, resort_id: resort.id)
      expect(subject).to be_valid
    end

    it "is not valid without a selected city" do
      subject.selected_city = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a user_id" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a resort_id" do
      subject.resort_id = nil
      expect(subject).to_not be_valid
    end
  end

  describe "associations" do
    it "belongs to a user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it "belongs to a resort" do
      association = described_class.reflect_on_association(:resort)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
