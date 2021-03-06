class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand

  validates :name, presence: true
  validates :price, presence: true
end
