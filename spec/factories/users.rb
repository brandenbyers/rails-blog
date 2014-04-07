# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { "user-#{SecureRandom.hex(8)}@example.com" }
    password "password"
  end
end
