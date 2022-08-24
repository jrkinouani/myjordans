class Basket < ApplicationRecord
  belongs_to :user

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end
end
