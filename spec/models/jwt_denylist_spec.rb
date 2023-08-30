require 'rails_helper'

RSpec.describe JwtDenylist, type: :model do
  describe 'table_name' do
    it 'has the correct table name' do
      expect(described_class.table_name).to eq('jwt_denylist')
    end
  end

  describe 'revocation strategy' do
    it 'uses the Denylist revocation strategy' do
      expect(described_class.included_modules).to include(Devise::JWT::RevocationStrategies::Denylist)
    end
  end
end
