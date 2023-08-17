class AddUserToResorts < ActiveRecord::Migration[7.0]
  def change
    add_reference :resorts, :user, null: false, foreign_key: true
  end
end
