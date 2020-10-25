FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    text { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 3 }
    delivery_cost_id { 3 }
    prefecture_id { 3 }
    days_to_ship_id { 2 }
    price { 5000 }
    image {Faker::Lorem.sentence}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
