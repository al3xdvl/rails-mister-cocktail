# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'


filepath = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

serialized_ingredients = open(filepath).read

ingredients = JSON.parse(serialized_ingredients)

puts "creating the ingredients"

ingredients["drinks"].each do |ingredient|
  ingre = ingredient["strIngredient1"].capitalize
  Ingredient.create!(name: ingre)
end

puts "ingredients created"
