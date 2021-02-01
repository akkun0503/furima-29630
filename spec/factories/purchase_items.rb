FactoryBot.define do
  factory :purchase_item do
    user_id { 11 }
    item_15 { 8 }
    nickname { 'suzuki' }
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    price { 2000 }
  end
end
