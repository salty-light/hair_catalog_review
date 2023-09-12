class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
       t.integer :hair_long_id, null: false
       t.string :name, null: false
      t.timestamps
    end
  end
end
