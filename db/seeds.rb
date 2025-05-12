# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Bookmark.destroy_all
Category.destroy_all
Recipe.destroy_all

puts "Creating recipes..."
spaghetti = Recipe.create!(
  name: "Spaghetti Carbonara",
  description: "A true Italian carbonara recipe, it's ready in about 30 minutes. There is no cream....",
  image_url: "https://www.allrecipes.com/thmb/g-WHS1O9D_pEeEheBamevcIjfq0=/160x90/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/11973-spaghetti-carbonara-ii-DDMFS-4x3-6edea51e421e4457ac0c3269f3be5157.jpg",
  rating: 4.5
)

salad = Recipe.create!(
  name: "Green Goddess Salad",
  description: "Combine spinach, parsley, basil, chives, tarragon, shallot, garlic, anchovy paste, and lime juice in a high-powered blender; blend and slowly...",
  image_url: "https://www.allrecipes.com/thmb/M9vZZBM1RLwFrisYyiXYyFlgv_0=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Green_Goddess_Dressing_4x3-STEP_060-9f2282f3c8a745508e5da1c2777a51c6.jpg",
  rating: 4.8
)

lamb = Recipe.create!(
  name: "Grilled Lamb Chops",
  description: "Greek-style grilled lamb chops, seasoned with a simple herb and lemon marinade, grill up grassy, sweet, and tender.",
  image_url: "https://www.allrecipes.com/thmb/KnAs90GUsMYm2dt_N2owpOy8ywA=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/8680071-greek-style-grilled-lamb-chops-ddmfs-2362-beauty-4x3-e65b5c16aacd494d82fe19ff6eb26677.jpg",
  rating: 4.8
)

haddock = Recipe.create!(
  name: "Baked Haddock",
  description: "This baked haddock recipe is quick and easy to prepare with a Parmesan bread crumb coating, plus it's a nice alternative to deep frying.",
  image_url: "https://www.allrecipes.com/thmb/M_060-9f2282f3c8a-74550e5da1c2777a51c6.jpg",
  rating: 4.6
)

puts "Creating categories..."
italian = Category.create!(name: "Italian")
salads = Category.create!(name: "Salads")
bbq = Category.create!(name: "Bbq")
fish = Category.create!(name: "Fish")

puts "Creating bookmarks..."
Bookmark.create!(recipe: spaghetti, category: italian, comment: "This is a traditional Roman recipe")
Bookmark.create!(recipe: salad, category: salads, comment: "My favorite healthy option")
Bookmark.create!(recipe: lamb, category: bbq, comment: "Greek-Style Grilled Lamb Chops")
Bookmark.create!(recipe: haddock, category: fish, comment: "Crispy goodness of fried fish")

puts "Finished!"
