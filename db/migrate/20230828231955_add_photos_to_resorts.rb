class AddPhotosToResorts < ActiveRecord::Migration[7.0]
  def change
    add_column :resorts, :photos, :text, array: true, default: []
  end
end
