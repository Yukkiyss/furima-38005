FactoryBot.define do
  factory :item do
    item_name             { '時計' }
    item_price            { 5000 }
    item_explanation_id   { 2 }
    category_id           { 2 }
    delivery_chage_id     { 2 }
    shipment_source_prefecture_id { 2 }
    send_date_id          { 2 }
    item_detail           { '新品の未使用です。使用予定がないので出品します。' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
