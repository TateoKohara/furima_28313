FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    family_name { "佐藤" }
    first_name { "次郎" }
    family_name_j { "サトウ" }
    first_name_j { "ジロウ" }
    birth { Date.new(1980, 9, 15)} 
  end
end