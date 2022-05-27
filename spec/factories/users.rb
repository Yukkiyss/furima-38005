FactoryBot.define do
  factory :user do
    nickname              {"toshio"}
    email                 {"sample@gmail.com"}
    password              {"a123456"}
    encrypted_password    {"a123456"}
    last_name             {"鈴木"}
    first_name            {"敏夫"}
    last_name_kana        {"スズキ"}
    first_name_kana       {"トシオ"}
    birth_day             {"2000-01-01"}
  end
end