# app/models/rental.rb
class Rental < ApplicationRecord
  # specifies that the renter association is an alias for the User model.
  belongs_to :user
  belongs_to :watch
  has_one :review, dependent: :destroy
end
