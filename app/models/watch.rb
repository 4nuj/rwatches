class Watch < ApplicationRecord
  belongs_to :user
  has_one_attached :image


  validates :brand, presence: true
  validates :model, presence: true
  validates :price, presence: true
end
