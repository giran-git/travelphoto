class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.integer :loca_area, null: false, default: 0
      t.string :name

      t.timestamps
    end
  end
end
