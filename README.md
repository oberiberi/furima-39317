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
- has_many :orders

## items テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| user                      | references | null: false, foreign_key: true |
| item_name                 | string     | null: false                    |
| price                     | integer    | null: false                    |
| category_id               | integer    | null: false                    |
| condition_id              | integer    | null: false                    |
| delivery_price_id         | integer    | null: false                    |
| prefecture_id             | integer    | null: false                    |
| standard_send_date_id     | integer    | null: false                    |
| content                   | text       | null: false                    |


### Association

- has_one :order
- belongs_to :user
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_price
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :standard_send_date


## buys テーブル

| Column                   | Type       | Options                         |
| ------------------------ | ---------- | ------------------------------- |
| user                     | references | null: false, foreign_key: true  |
| item                     | references | null: false, foreign_key: true  |
 
### Association

- belongs_to :user
- belongs_to :item
- has_one :send_address


## send_addresses テーブル

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

- belongs_to :order
- has_one_active_hash :prefecture_id      

