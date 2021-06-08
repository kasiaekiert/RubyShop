FactoryBot.define do
  factory :product do
    sequence(:name) do |n|
      "Product_#{n}"
    end
    price { 10.00 }
    image { 'MyString' }
    category
    brand
  end
end
