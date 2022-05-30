class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :item_name, presence: true
  validates :item_price, presence: true
  validates :item_explanation_id, presence: true
  validates :category_id, presence: true
  validates :delivery_chage_id, presence: true
  validates :shipment_source_prefecture_id, presence: true
  validates :send_date_id, presence: true
  validates :item_detail, presence: true

end
