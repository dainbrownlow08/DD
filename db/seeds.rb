# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FoodBank.destroy_all
GroceryStore.destroy_all
Trip.destroy_all
Volunteer.destroy_all
FoodItem.destroy_all

# 10.times do
#     Volunteer.create({
#       name: Faker::Name.name,
#       location: (1..100).to_a.sample,
#       username: Faker::Name.name,
#       password_digest: Faker::Bank.account_number
#     })
# end

Volunteer.create(name: "Manager",username: "Manager", location: 1,password_digest: "whatever")

10.times do
  FoodBank.create({
    name: "FB: #{Faker::Company.name}",
    username: Faker::Name.name,
    password_digest: "abcd",
    location: (1..100).to_a.sample
  })
end

10.times do 
  GroceryStore.create({
    name: "GS: #{Faker::Company.name}",
    location: (1..100).to_a.sample
  })
end

10.times do
  Trip.create({
    grocery_store_id: GroceryStore.all.map{|f|f.id}.sample,
    food_bank_id: FoodBank.all.map{|f|f.id}.sample,
    volunteer_id: Volunteer.find_by(username: "Manager").id
  })
end

50.times do
  FoodItem.create({
    name: Faker::Food.ingredient,
    owner_type: "GroceryStore",
    owner_id: GroceryStore.all.map{|g| g.id}.sample
  })
end

puts "yay"