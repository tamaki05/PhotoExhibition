class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :exhibition

  def get_image( width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end
end
