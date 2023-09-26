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

  def self.looks(search, word)
    if search == "perfect_match"
      hair_longs = HairLong.where("name LIKE?","#{word}")#
    elsif search == "forward_match"
      hair_longs = HairLong.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      hair_longs = HairLong.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      hair_longs = HairLong.where("name LIKE?","%#{word}%")
    else
      hair_longs = HairLong.all
    end
    hair_catalogs = HairCatalog.where(hair_long: hair_longs)
    # byebug
    return hair_catalogs
  end
end
