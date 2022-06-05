class CreateDomiciles < ActiveRecord::Migration[6.0]
  def change
    create_table :domiciles do |t|
      t.string  :postcode, null: false
      t.integer  :shipment_source_prefecture_id, null: false
      t.string  :buyer_city, null: false
      t.string  :buyer_block, null: false
      t.string  :buyer_building
      t.string  :buyer_phone_number, null: false
      t.integer  :item_explanation_id, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
