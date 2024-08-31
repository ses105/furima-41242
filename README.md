# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date         | string | null: false |

### Association
-has_many :items
-has_many :purchases


## items テーブル

| Column                  | Type       | Options     |
| ------------------------| ---------- | ----------- |
| name                    | string     | null: false |
| info                    | text       | null: false |
| price                   | integer    | null: false |
| category_id             | integer    | null: false |
| sales_status_id         | integer    | null: false |
| shopping_fee_status_id  | integer    | null: false |
| prefecture_id           | integer    | null: false |
| scheduled_delivery_id   | integer    | null: false |
| user_id                 | references | null: false, foreign_key: true |

### Association
- has_one :product
- belongs_to :category
- belongs_to :sales_status
- belongs_to :shopping_fee_status
- belongs_to :prefecture
- belongs_to :scheduled_delivery
- belongs_to :user


## purchases テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| item_id       | references | null: false, foreign_key: true |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address


## Addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| postal_code   | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building      | string     | null: false |
| phone_number  | integer    | null: false |
| purchase_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :prefecture
- belongs_to :purchase