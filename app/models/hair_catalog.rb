class HairCatalog < ApplicationRecord
  belongs_to :hair_long
  with_options presence: true do
   validates :name
   validates :explamatory_text

   # validates :stock
   validates :image
 end
 scope :latest, -> {order(created_at: :desc)}
 scope :old, -> {order(created_at: :asc)}
 scope :star_count, -> {order(star: :desc)}
 has_many :reviews,dependent: :destroy
   #ヘアカタログの写真
 has_one_attached :image
end
