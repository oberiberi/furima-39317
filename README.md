## テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :comments

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | -------    | ------------------------------ |
| user_id      | references | null: false,foreign_key: true  |
| comment_text | string     | null: false                    |
| item_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## items テーブル

| Column                     | Type       | Options                        |
| -------------------------  | ---------- | ------------------------------ |
| category                   | string     | null: fals                     |
| item_id                    | references | null: false, foreign_key: true |
| user_id                    | references | null: false, foreign_key: true |
| image                      | string     | null: false                    |
| commmodity condition       | string     | null: false                    |
| bunden of shipping         | string     | null: false                    |
| shipping area              | string     | null: false,                   |
| estimated shipping date    | string     | null: false,                   |
### Association

- has_many :comments
- belongs_to :user