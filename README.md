## テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :oders

## items テーブル

| Column                     | Type       | Options     |
| -------------------------  | ---------- | ----------- |
| seller_name                | string     | null: false |
| item_name                  | string     | null: false |
| item_text                  | string     | null: false |
| image                      | string     | null: false |
| category                   | string     | null: false |
| commodity condition        | string     | null: false |

### Association

- belongs_to :oder
- belongs_to :user


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


## shipping テーブル

| Column                   | Type       | Options                         |
| ------------------------ | ---------- | ------------------------------- |
| user_id                  | references | null: false, foreign_key: true  |
| credit card number       | string     | null: false                     |
| commodity condition      | string     | null: false                     |
| security code            | string     | null: false                     |
| address                  | string     | null: false,                    |
| telephon number          | string     | null: false,                    |
 
### Association

- belongs_to :oder