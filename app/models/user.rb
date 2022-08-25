class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :baskets
  has_many :bookings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Ici on ressort la liste des bookings faite à mes baskets
  has_many :requested_bookings, through: :baskets, source: :bookings

  # Ici on ressort la liste des Jordans que j'ai loué moi
  has_many :rented_jordans, through: :bookings, source: :basket
end
