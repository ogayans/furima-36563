FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"1a2b3c"}
    password_confirmation {password}
    last_name             {"青木"}
    first_name            {"太郎"}
    last_name_kana        {"アオキ"}
    first_name_kana       {"タロウ"}
    birthday              {"1930-01-01"}
  end
end