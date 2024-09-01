require 'nkf'

FactoryBot.define do
  factory :user do
    Faker::Config.locale = 'ja'

    nickname              {Faker::Name.name}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length:6)}
    password_confirmation {password}
    last_name             {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    last_name_kana        {Faker::Name.last_name}
    first_name_kana       {Faker::Name.first_name}
    birth_date            {Faker::Date.backward(days: 30)}

  end
end
