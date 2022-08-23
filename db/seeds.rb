# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "delete db"
Basket.destroy_all
User.destroy_all

user = User.create!(first_name: "charles", last_name: "Martel", email: "charles@gmail.com", password: '123456')

require "json"
require "open-uri"

url = "https://sold-out.io/api/sneakers?search=jordan"
sneakers_serialized = URI.open(url).read
sneakers = JSON.parse(sneakers_serialized)
count = 0

loop do
    sneakers.each do |sneaker|
        if count > 50 then
            exit
        end
        if sneaker['main_picture']['url'].include?("data:image") then
            next
        end
        count += 1
        Basket.create!({
            name: sneaker['model'],
            description: sneaker['description'],
            size: rand(38..45),
            price_per_day: sneaker['price'] / 10,
            image: "https://sold-out.io#{sneaker['main_picture']['url']}",
            user_id: user.id
        })
    end
end
puts "db created"
