# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false,unique:true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                      | Type       | Options                        |
| --------------------------- | ---------- | ------------------------------ |
| item_name                   | string     | null: false                    |
| item_price                  | integer    | null: false                    |
| item_explanation            | text       | null: false                    |
| listing_user                | references | null: false, foreign_key: true |
| category                    | string     | null: false                    |
| delivery_chage              | integer    | null: false                    |
| shipment_source_prefecture  | string     | null: false                    |
| send_date                   | string     | null: false                    |
| liles                       | string     | null: false                    |

### Association

- belongs_to :user
- has_one :order


## ordersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| buyer_name         | references | null: false, foreign_key: true |
| purchase_item_name | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :domicile

## domicilesテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postcode           | string     | null: false                    |
| buyer_prefecture   | string     | null: false                    |
| buyer_city         | string     | null: false                    |
| buyer_block        | string     | null: false                    |
| buyer_building     | string     | null: false                    |
| buyer_phone_number | string     | null: false                    |

### Association

- belongs_to :order
