class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_name, null: false
      t.integer  :item_price, null: false
      t.integer  :item_explanation_id, null: false
      t.references :user, null: false, foreign_key: true
      t.integer  :category_id, null: false
      t.integer  :delivery_chage_id, null: false
      t.integer  :shipment_source_prefecture_id, null: false
      t.integer  :send_date_id, null: false
      t.text  :item_detail, null: false
      t.timestamps
    end
  end
end
