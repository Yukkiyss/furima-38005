FactoryBot.define do
  factory :user do
    nickname              { 'toshio' }
    email                 { Faker::Internet.email }
    password              { 'a123456' }
    password_confirmation { 'a123456' }
    last_name             { '鈴木' }
    first_name            { '敏夫' }
    last_name_kana        { 'スズキ' }
    first_name_kana       { 'トシオ' }
    birthday              { '2000-01-01' }
  end
end
