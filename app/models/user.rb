class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :email, presence: true, length: { in: 1..100 }
  validates :password, presence: true, length: { in: 6..50 }
end
