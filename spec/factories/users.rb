FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 5)}
    email                 {Faker::Internet.free_email}
    password              {"abc123456"}
    password_confirmation {password}
    first_name            {"あいうえお"}
    last_name             {"かきくけこ"}
    first_name_kana       {"アイウエオ"}
    last_name_kana        {"カキクケコ"}
    birth_date            {Faker::Date.in_date_period}
  end
end