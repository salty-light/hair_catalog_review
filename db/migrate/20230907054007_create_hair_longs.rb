class CreateHairLongs < ActiveRecord::Migration[6.1]
  def change
    create_table :hair_longs do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
