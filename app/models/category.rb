class Category < ApplicationRecord
  has_many :exhibitions
  validates :name, presence: true

  def get_image( width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end
end
