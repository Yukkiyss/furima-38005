class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :item_name, presence: true
  validates :item_detail, presence: true
  validates :image, presence: true
  validates :item_price, presence: true, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :delivery_chage_id
    validates :item_explanation_id
    validates :shipment_source_prefecture_id
    validates :send_date_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_chage
  belongs_to :item_explanation
  belongs_to :shipment_source_prefecture
  belongs_to :send_date
end
