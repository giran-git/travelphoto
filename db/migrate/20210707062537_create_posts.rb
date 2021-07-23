class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :post_area, null: false, default: 0
      t.string :name
      t.string :text
      t.text :body
      t.string :title, null: false
      t.integer :genre_id

      t.string :image_id
      t.integer :customer_id
      t.timestamps
    end
  end
end
