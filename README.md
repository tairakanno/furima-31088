# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| --------       | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| name           | string | null: false |
| name(katakana) | string | null: false |
| birthday       | date   | null: false |


### Association

- has_many :items
- has_many :purchase records

## items テーブル

| Column         | Type   | Options     |
| ------         | ------ | ----------- |
| image          | string | null: false |
| name           | string | null: false |
| text           | text   | null: false |
| category       | string | null: false |
| status         | string | null: false |
|  delivery cost | string | null: false |
| shipment source| string | null: false |
| days to ship   | string | null: false |
| price          | integer| null: false |
| user_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase record

## purchase records テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| purchase time | integer    | null: false |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping address


## shipping address テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| postal code       | integer     | null: false |
| prefectures       | string | null: false |
| municipality      | string | null: false |
| address           | integer | null: false |
| building name     | string | 
| phone number      | string | null: false |
|purchase record_id | references　| null: false, foreign_key: true |

### Association
- belongs_to :purchase record