class OrderDomicile
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :shipment_source_prefecture_id, :buyer_city, :buyer_block, :buyer_building,
                :buyer_phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :buyer_city
    validates :buyer_block
    validates :buyer_phone_number, numericality: { only_integer: true }
    validates :token
  end

  validates :shipment_source_prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :buyer_phone_number, length: { minimum: 10, maximum: 11 }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Domicile.create(postcode: postcode, shipment_source_prefecture_id: shipment_source_prefecture_id, buyer_city: buyer_city,
                    buyer_block: buyer_block, buyer_building: buyer_building,
                    buyer_phone_number: buyer_phone_number, order_id: order.id)
  end
end
