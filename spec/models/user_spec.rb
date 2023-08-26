require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with a email' do
      user = User.new(email: 'john@example.com', password: '123456')
      expect(user).to be_valid
    end

    it 'is invalid without a email' do
      user = User.new(email: nil)
      expect(user).to_not be_valid
    end

    it 'is invalid with a email longer than 100 characters' do
      user = User.new(email: 'a' * 102)
      expect(user).to_not be_valid
    end

    it 'is invalid without a encrypted_password' do
      user = User.new(encrypted_password: nil)
      expect(user).to_not be_valid
    end

    it 'is invalid with a encrypted_password longer than 50 characters' do
      user = User.new(encrypted_password: 'a' * 52)
      expect(user).to_not be_valid
    end
  end    
end
