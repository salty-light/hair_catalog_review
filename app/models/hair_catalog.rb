class HairCatalog < ApplicationRecord
belongs_to :hair_longs
  with_options presence: true do
   validates :name
   validates :explamatory_text
   validates :without_tax_price
   validates :genre_id

   # validates :stock
   validates :image
 end
   #ヘアカタログの写真
 has_one_attached :image
end
