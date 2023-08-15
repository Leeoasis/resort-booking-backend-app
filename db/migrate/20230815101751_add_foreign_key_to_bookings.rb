class AddForeignKeyToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :resort, foreign_key: true
  end
end
