## テーブル設計

## users テーブル

| Column                   | Type       | Options                   |
| ------------------------ | ---------- | ------------------------  |
| nickname                 | string     | null: false               |
| email                    | string     | null: false, unique: true |
| encrypted_password       | string     | null: false               |
| last_name                | string     | null: false               |
| first_name               | string     | null: false               |
| last_name_kana           | string     | null: false               |
| first_name_kana          | string     | null: false               |
| birth_date               | date       | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| user                      | references | null: false, foreign_key: true |
| item_name                 | string     | null: false                    |
| price                     | integer    | null: false                    |
| category_id               | integer    | null: false                    |
| item_condition_id         | integer    | null: false                    |
| delivery_price_id         | integer    | null: false                    |
| prefecture_id             | integer    | null: false                    |
| standard_shipping_date_id | integer    | null: false                    |
| item_content              | text       | null: false                    |


### Association

- has_one :buy
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :delivery_price
- belongs_to_active_hash :prefecture_id 
- belongs_to_active_hash :standard_send_date


## buys テーブル

| Column                   | Type       | Options                         |
| ------------------------ | ---------- | ------------------------------- |
| user                     | references | null: false, foreign_key: true  |
| item                     | references | null: false, foreign_key: true  |
 
### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_address テーブル

| Column                   | Type       | Options                         |
| ------------------------ | ---------- | ------------------------------- |
| post_code                | string     | null: false                     |
| prefecture_id            | integer    | null: false                     |
| municipality             | string     | null: false                     |
| address                  | string     | null: false                     |
| building_name            | string     |                                 |
| telephon_number          | string     | null: false                     |
| buy                      | references | null: false, foreign_key: true  |
 
### Association

- belongs_to :buy
- has_one_active_hash :prefecture_id        

