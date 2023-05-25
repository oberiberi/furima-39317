## テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------  |
| name               | string | null: false               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| date of birth      | string | null: false               |

### Association

- has_many :items
- has_many :oders
- has_many :shipping, through: :oders

## items テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| user_id                   | references    | null: false, foreign_key: true |
| item_name                 | string     | null: false                    |
| item_price                | string     | null: false                    |
| image                     | string     | null: false                    |
| category                  | string     | null: false                    |
| commodity condition       | string     | null: false                    |
| shipping charges          | string     | null: false                    |
| shipping area             | string     | null: false,                   |
| estimated shipping date   | string     | null: false,                   |

### Association

- belongs_to :oder
- belongs_to :user
- belongs_to :shipping


## oders テーブル

| Column                   | Type       | Options                         |
| ------------------------ | ---------- | ------------------------------- |
| user_id                  | references | null: false, foreign_key: true  |
| item_id                  | references | null: false, foreign_key: true  |
| commodity condition      | references | null: false, foreign_key: true  |
| shipping charges         | string     | null: false                     |
| shipping area            | string     | null: false,                    |
| estimated shipping date  | string     | null: false,                    |
 
### Association

- belongs_to :user
- belongs_to :item
- belongs_to :shipping

## shippings テーブル

| Column                   | Type       | Options                         |
| ------------------------ | ---------- | ------------------------------- |
| user_id                  | string     | null: false                     |
| post code                | string     | null: false                     |
| prefectures              | string     | null: false                     |
| municipality             | string     | null: false                     |
| address                  | string     | null: false                     |
| building name            | string     |                                 |
| telephon number          | string     | null: false                     |
 
### Association

- belongs_to :oder
- belongs_to :user
- has_many   :items, through: :oder

