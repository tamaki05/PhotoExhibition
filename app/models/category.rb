class Category < ApplicationRecord
  has_many :exhibitions
  validates :name, presence: true
end
