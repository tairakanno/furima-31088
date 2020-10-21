FactoryBot.define do
  factory :user do
    nickname {Faker: :Name.last_name}
    email {Faker: :Internet.free_email}
    password {Faker: :Internet.password(min_length:6)}
    password_confirmation {password}
    last_name {Faker: :name.last_name}
    first_name {Faker: :name.last_name}
    last_name_katakana  {"カタ"}
    first_name_katakana  {"カナ"}
  end
end
