## users テーブル

| Column         | Type   | Options     |
| --------       | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_katakana  | string | null: false |
| first_name_katakana | string | null: false |
| birthday            | date   | null: false |


### Association

- has_many :items
- has_many :purchase_records

## items テーブル

| Column         | Type   | Options     |
| ------         | ------ | ----------- |
| image          | string | null: false |
| name           | string | null: false |
| text           | text   | null: false |
| category_id       | integer | null: false |
| status_id         | integer| null: false |
| delivery_cost_id  | integer | null: false |
| shipment_source_id| integer | null: false |
| days_to_ship_id   | integer | null: false |
| price          | integer| null: false |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase record
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_cost
- belongs_to_active_hash :shipment_source
- belongs_to_active_hash :days_to_ship
- has_one_attached :image

## purchase_records テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| purchase_time | integer    | null: false |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_address テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| postal_code       | string     | null: false |
| prefectures       | string | null: false |
| municipality      | string | null: false |
| address           | string | null: false |
| building_name     | string | 
| phone_number      | string | null: false |
|purchase_record    | references　| null: false, foreign_key: true |

### Association
- belongs_to :purchase record
