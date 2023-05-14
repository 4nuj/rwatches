# app/models/rental.rb
class Rental < ApplicationRecord
  # specifies that the renter association is an alias for the User model.
  belongs_to :renter, class_name: "User"
  belongs_to :watch
  belongs_to :watch_owner, class_name: "User"
end
