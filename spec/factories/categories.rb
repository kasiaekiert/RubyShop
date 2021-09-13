# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    sequence(:name) do |n|
      "Category_#{n}"
    end
  end
end
