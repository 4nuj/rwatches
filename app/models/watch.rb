class Watch < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :rentals, dependent: :destroy
  has_many :reviews, through: :rentals
  validates :brand, presence: true
  validates :model, presence: true
  validates :price, presence: true


  def average_rating
    reviews.average(:rating)
  end



end
