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
| birthday                 | date       | null: false               |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| user                      | references | null: false, foreign_key: true |
| item_name                 | string     | null: false                    |
| price                     | integer    | null: false                    |
| category                  | string     | null: false                    |
| commodity condition       | string     | null: false                    |
| shipping charges          | string     | null: false                    |
| shipping area             | string     | null: false,                   |
| estimated shipping date   | string     | null: false,                   |

### Association

- belongs_to :buy
- belongs_to :user


## buys テーブル

| Column                   | Type       | Options                         |
| ------------------------ | ---------- | ------------------------------- |
| user                     | references | null: false, foreign_key: true  |
| item                     | references | null: false, foreign_key: true  |

 
### Association

- belongs_to :shipping
- belongs_to :user
- has_many :items


## shippings テーブル

| Column                   | Type       | Options                         |
| ------------------------ | ---------- | ------------------------------- |
| post code                | integer    | null: false                     |
| prefectures              | string     | null: false                     |
| municipality             | string     | null: false                     |
| address                  | string     | null: false                     |
| building name            | string     |                                 |
| telephon number          | string     | null: false                     |
| buying_history           | references | null: false, foreign_key: true  |
 
### Association

- has_many :buys

