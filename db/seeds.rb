# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Category.destroy_all
Idea.destroy_all

CATEGORIES = ["Eureka", "Inside the Box", "Peace Treaty", "Collective", "Zombie", "Phoenix"]
OPTIONS = []
IMAGE_CATEGORIES = ["abstract", "animals", "business", "cats", "city", "fashion", "food", "nature", "nightlife", "people", "sports", "technics", "transport"]

6.times do |users|
  name = Faker::FamilyGuy.character
  email = "#{name.gsub(/\s+/, "")}@fox.com"
  password = name.split.first.downcase
  User.create(name: name, email: email, password: password)
  puts "Created #{name}'s account'"
end

CATEGORIES.each do |i|
  category = Category.create(name: i)
  puts "Created #{category.name}"
end

30.times do |ideas|
  idea = Idea.create(content: Faker::HitchhikersGuideToTheGalaxy.quote, category_id: rand(1..6), user_id: rand(1..5))
  puts "Created idea: #{idea.content}"
end

IMAGE_CATEGORIES.each do |image|
  Image.create(name: image, path: "http://lorempixel.com/200/200/#{image}")
  puts "Created Image: #{image}"
end

20.times do |idea_images|
  idea = Idea.find(rand(1..30))
  image = Image.find(rand(1..13))
  idea.images << image

end

20.times do |image_ideas|
  idea = Idea.find(rand(1..30))
  image = Image.find(rand(1..13))
  image.ideas << idea
end
