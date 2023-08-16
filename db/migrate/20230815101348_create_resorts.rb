class CreateResorts < ActiveRecord::Migration[7.0]
  def change
    create_table :resorts do |t|
      t.string :name
      t.string :address
      t.text :description
      t.string :phone_number
      t.string :email
      t.string :city
      t.string :country
      t.integer :available_rooms
      t.integer :max_occupancy
      t.decimal :base_price

      t.timestamps
    end
  end
end
