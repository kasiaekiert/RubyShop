# frozen_string_literal: true

FactoryBot.define do
  factory :brand do
    sequence(:name) do |n|
      "Brand_#{n}"
    end
  end
end
