# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) do |n|
      "person#{n}@example.com"
    end
    password { 'password123' }
  end

  factory :admin_user, parent: :user do
    email { 'admin@example.com' }
    password { 'password' }
    admin { true }
    admin_role { true }
    role { 1 }
  end
end
