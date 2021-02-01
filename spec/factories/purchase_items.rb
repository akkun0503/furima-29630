FactoryBot.define do
  factory :purchase_item do
    postal_code { '123-4567' }
    prefecture_id { 23 }
    city { '東京都' }
    address { '中央区日本橋馬喰町' }
    building { 'プレジリア東日本橋806' }
    phone_number { 12345678 }
  end
end