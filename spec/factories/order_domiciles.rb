FactoryBot.define do
  factory :order_domicile do
    postcode { '123-4567' }
    shipment_source_prefecture_id { 2 }
    buyer_city { '大垣市' }
    buyer_block { '1-1' }
    buyer_building     { '岐阜ハイツ' }
    buyer_phone_number { '09032324545' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
