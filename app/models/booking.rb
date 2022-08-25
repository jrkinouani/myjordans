class Booking < ApplicationRecord
  STATUS = %w(pending accepted declined canceled)

  belongs_to :user
  belongs_to :basket

  validates :status, inclusion: { in: Booking::STATUS } 
end
