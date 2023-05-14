class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :watches, dependent: :destroy
  has_many :rentals, through: :watches
  has_many :lettings, class_name: "Rental", foreign_key: :renter_id
end
