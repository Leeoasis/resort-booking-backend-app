class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :resort, foreign_key: true
      t.date :selected_date
      t.string :selected_city

      t.timestamps
    end
  end
end
