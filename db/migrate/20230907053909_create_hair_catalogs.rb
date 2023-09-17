class CreateHairCatalogs < ActiveRecord::Migration[6.1]
  def change
    create_table :hair_catalogs do |t|
      t.integer :hair_long_id, null: false
      t.string :name, null: false
      t.text :explamatory_text, null: false

      t.timestamps
    end
  end
end
