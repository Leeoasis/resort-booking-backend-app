require 'rails_helper'

RSpec.describe Resort, type: :model do

  describe "validations" do
    it "is valid with valid attributes" do
      user = User.create(email: 'john@example.com', password: '123456')
      subject = user.resorts.build(name: "Resort Name", address: "123 Main St.", description: "A beautiful resort", phone_number: 1234567890, email: "resort@example.com", country: "USA", city: "New York", available_rooms: 10, max_occupancy: 20, base_price: 100, user_id: user.id)
      expect(subject).to be_valid
    end

    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an address" do
      subject.address = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a description" do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a phone number" do
      subject.phone_number = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with a non-numeric phone number" do
      subject.phone_number = "abc"
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a country" do
      subject.country = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a city" do
      subject.city = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without available rooms" do
      subject.available_rooms = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with a non-numeric available rooms value" do
      subject.available_rooms = "abc"
      expect(subject).to_not be_valid
    end

    it "is not valid without max occupancy" do
      subject.max_occupancy = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with a non-numeric max occupancy value" do
      subject.max_occupancy = "abc"
      expect(subject).to_not be_valid
    end

    it "is not valid without a base price" do
      subject.base_price = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with a non-numeric base price value" do
      subject.base_price = "abc"
      expect(subject).to_not be_valid
    end

    it "is not valid without a user ID" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid with a non-numeric user ID value" do
      subject.user_id = "abc"
      expect(subject).to_not be_valid
    end
  end
end
