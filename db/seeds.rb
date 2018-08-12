# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
require 'open-uri'
require 'json'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

ingredients["drinks"].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end


photo_url1 = "https://images.unsplash.com/photo-1470337458703-46ad1756a187?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=1998822d443cf97d75258149476c5aa5&auto=format&fit=crop&w=1949&q=80"
cocktail = Cocktail.new(name: 'Whiskey Friskey')
cocktail.remote_photo_url = photo_url1
cocktail.save

photo_url2 = "https://images.unsplash.com/photo-1438522014717-d7ce32b9bab9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=55cb1a59dd5a3cecf474342bc3048ea7&auto=format&fit=crop&w=1949&q=80"
cocktail = Cocktail.new(name: 'Strawberry Mojito')
cocktail.remote_photo_url = photo_url2
cocktail.save

photo_url3 = "https://images.unsplash.com/photo-1517644493876-7864565e3bf9?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=eaa4adf6cdb9cafa4fada1580b7c8e2c&auto=format&fit=crop&w=934&q=80"
cocktail = Cocktail.new(name: 'Moscow Mule')
cocktail.remote_photo_url = photo_url3
cocktail.save
