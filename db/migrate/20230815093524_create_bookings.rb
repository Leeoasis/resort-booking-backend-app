class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :customer_name
      t.string :contact_information
      t.datetime :reservation_date
      t.integer :duration
      t.integer :num_guests

      t.timestamps
    end
  end
end
