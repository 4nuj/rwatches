class Watch < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :rentals, dependent: :destroy
  has_many :reviews, through: :rentals
  validates :brand, presence: true
  validates :model, presence: true
  validates :price, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average_rating
    reviews.average(:rating)
  end

  include PgSearch::Model
  pg_search_scope :search_by_brand_and_model,
    against: [ :brand, :model ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
