class Basket < ApplicationRecord
	belongs_to :users
	def self.search(search)
     where("name LIKE ?", "%#{search}%")

  end
end
