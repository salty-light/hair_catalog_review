class Review < ApplicationRecord
belongs_to :hair_catalog
belongs_to :customer
#rebyunogazou

has_one_attached :image
end
