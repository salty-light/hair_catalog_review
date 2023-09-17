class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :hair_catalog_id, null: false
      t.integer :customer_id, null: false
      t.text :body, null: false
      t.float :score, default: 0
      t.timestamps
    end
  end
end
