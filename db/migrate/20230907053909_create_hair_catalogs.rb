class CreateHairCatalogs < ActiveRecord::Migration[6.1]
  def change
    create_table :hair_catalogs do |t|
      t.integer :hair_longs_id, null: false
      t.string :name, null: false
      t.text :explamatory_text, null: false

      t.boolean :is_sales_status, null: false, default: true
      t.timestamps
    end
  end
end
