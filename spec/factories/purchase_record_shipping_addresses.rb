FactoryBot.define do
  factory :purchase_record_shipping_address do
    # user_id {3}
    # item_id {3}
    postal_code { '123-4567' }
    prefecture_id { 3 }
    municipality { '東京都' }
    address { '1-1-1' }
    building_name { '東京ハイツ' }
    phone_number { "99999999999" }
    token { 'tok_0000000000' }
  end
end
