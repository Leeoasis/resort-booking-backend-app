class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :resort, null: false, foreign_key: true
      t.date :reservation_date
      t.date :returning_date
      t.string :selected_city

      t.timestamps
    end
  end
end
