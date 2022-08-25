class Basket < ApplicationRecord
  belongs_to :user
  has_many :bookings
  
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
