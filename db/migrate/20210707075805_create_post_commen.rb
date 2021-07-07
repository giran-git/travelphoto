class CreatePostCommen < ActiveRecord::Migration[5.2]
  def change
    create_table :post_commen do |t|

      t.timestamps
    end
  end
end
