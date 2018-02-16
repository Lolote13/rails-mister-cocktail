# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'open-uri'

Ingredient.destroy_all

ingredient_array = JSON.parse(open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)["drinks"]
ingredient_list = []
ingredient_array.each do |ingredient|
  ingredient_list << ingredient["strIngredient1"]
end

ingredient_list.each do |ingredient_name|
  Ingredient.create!(name: ingredient_name)
end
