## users テーブル

| Column         | Type   | Options     |
| --------       | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false | unique: true
| password       | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_katakana  | string | null: false |
| first_name_katakana | string | null: false |
| birthday_year_id         | integer   | null: false |
| birthday_month_id         | integer   | null: false |
| birthday_day_id         | integer   | null: false |
### Association

- has_many :items
- has_many :purchase_records
- belongs_to_active_hash :birthday_year
- belongs_to_active_hash :birthday_month
- belongs_to_active_hash :birthday_day
## items テーブル

| Column         | Type   | Options     |
| ------         | ------ | ----------- |
| name           | string | null: false |
| text           | text   | null: false |
| category_id       | integer | null: false |
| status_id         | integer | null: false |
| delivery_cost_id  | integer | null: false |
| prefecture_id    | integer | null: false |
| days_to_ship_id   | integer | null: false |
| price             | integer | null: false |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_cost
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :days_to_ship
- has_one_attached :image

## purchase_records テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_address テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| postal_code       | string | null: false |
| prefecture_id    | integer| null: false |
| municipality      | string | null: false |
| address           | string | null: false |
| building_name     | string | 
| phone_number      | string | null: false |
| purchase_record   | references　| null: false, foreign_key: true |

### Association
- belongs_to :purchase_record
- belongs_to_active_hash :prefecture
