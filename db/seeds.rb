# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Ingredient.destroy_all
# Dose.destroy_all
# Cocktail.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'

10.times do
  buffer = open(url).read
  result = JSON.parse(buffer)
  name_cocktail = result['drinks'].first['strDrink']
  c1 = Cocktail.create({name: name_cocktail})

  name_ingredient1 = result['drinks'].first['strIngredient1']
  i1 = Ingredient.create(name: name_ingredient1)

  name_ingredient2 = result['drinks'].first['strIngredient2']
  i2 = Ingredient.create(name: name_ingredient2)

  d1 = Dose.new({
       description: "1",
       cocktail: c1,
       ingredient: i1,
  })
  d1.save!

  d1 = Dose.new({
       description: "1",
       cocktail: c1,
       ingredient: i2,
  })
  d1.save!
end

# Ingredient.destroy_all
# Dose.destroy_all
# Cocktail.destroy_all

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")
# i1 = Ingredient.create(name: "gin")
# i2 = Ingredient.create(name: "vermouth")

# c1 = Cocktail.create({name: "Martini"})

# d1 = Dose.new({
#     description: "1 cl",
#     cocktail: c1,
#     ingredient: i1,
# })
# d1.save!

# d2 = Dose.new({
#     description: "2 cl",
#     cocktail: c1,
#     ingredient: i2,
# })
# d2.save!
