FactoryBot.define do
  factory :user do
  sequence(:email) { |n| "user#{n}@example.com" }
  name 'test name'
  end
end