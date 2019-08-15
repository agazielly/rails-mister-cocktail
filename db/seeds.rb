# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

puts 'Creating ingredients...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktails_serialized = open(url).read
elements = JSON.parse(cocktails_serialized)

# puts drinks.first

elements["drinks"].each do |ingredient|
  ingredient = Ingredient.create(name: ingredient["strIngredient1"])
  # ingredient.save!
end

puts 'Creating coctails...'

Cocktail.create(name: "Mojito")
Cocktail.create(name: "Margarita")
Cocktail.create(name: "Vodka Martini")

puts 'Finished!'
