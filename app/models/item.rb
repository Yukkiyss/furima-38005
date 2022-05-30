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
