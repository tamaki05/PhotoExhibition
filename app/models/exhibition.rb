class Exhibition < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  belongs_to :category

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  def get_imane( width, height)
    image.variant(resize_to_limit: [width, height]).processed
  end
end
