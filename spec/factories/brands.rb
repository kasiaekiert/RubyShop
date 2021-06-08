FactoryBot.define do
  factory :brand do
    sequence(:name) do |n|
      "Brand_#{n}"
    end
  end
end
