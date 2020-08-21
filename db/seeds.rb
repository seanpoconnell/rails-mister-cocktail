# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# add ingredients
require 'open-uri'
require 'json'

puts "cleaning ingredients db!"
Ingredient.delete_all
Ingredient.reset_pk_sequence
puts "db cleaned!"
puts "parsing ingredients"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

json = open(url).read
ingredients = JSON.parse(json)["drinks"]

ingredients.each do |ing|
  ingredient = ing["strIngredient1"]
  Ingredient.create(name: ingredient)
end
puts "ingredients added!"

# add cocktails
puts 'destroying all cocktails!'
Cocktail.delete_all
Cocktail.reset_pk_sequence
# Cocktail.destroy_all
puts 'DB is clean'

puts 'creating cocktails'
20.times do |cocktail|
  ct = Cocktail.create!(
    name: Faker::Coffee.blend_name
  )
  puts "created cocktail number #{cocktail}"
end

puts "Done!"
