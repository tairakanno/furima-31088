FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length:6)}
    password_confirmation {password}
    last_name {Faker::Name.initials}
    first_name {Faker::Name.initials}
    last_name_katakana  {"カタ"}
    first_name_katakana  {"カナ"}
    birth_date {'1999-02-02'}
  end
end
