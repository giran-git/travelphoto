class CreatePostComment < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comment do |t|

      t.timestamps
    end
  end
end
