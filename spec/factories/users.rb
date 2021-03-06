FactoryBot.define do
  factory :user do
    sequence(:name)       { |n| "user#{n}" }
    sequence(:email)      { |n| "email#{n}@user.com" }
    password              '12345678'
    password_confirmation '12345678'
  end
end
