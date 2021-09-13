# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user = User.create(email:'user@example.com', password: 'password', admin: false, role: 'user')
admin = User.create(email:'admin@example.com', password: 'password', admin: true, role: 'admin')

5.times do 
  brand = Brand.create(name: Faker::Company.name)
  category = Category.create(name: Faker::Color.color_name)
end

10.times do
  product = Product.create(name: Faker::Device.model_name,
                          brand: Brand.all.sample,
                          category: Category.all.sample)
end
