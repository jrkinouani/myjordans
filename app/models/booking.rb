class Booking < ApplicationRecord
  STATUS = %w(attente acceptée declinée annulée)

  belongs_to :user
  belongs_to :basket

  validates :status, inclusion: { in: Booking::STATUS } 
end
