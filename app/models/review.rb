class Review < ApplicationRecord
belongs_to :hair_catalog
belongs_to :customer
#rebyunogazou
has_many :favorites, dependent: :destroy
 def favorited_by?(customer)
   favorites.exists?(customer_id: customer.id)
 end
has_one_attached :image
validates :image, presence: true
end
