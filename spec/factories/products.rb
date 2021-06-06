FactoryBot.define do
  factory :product do
    name { Faker::Book }
    price { 10.00 }
    image { 'MyString' }
    category
    brand
  end
end
