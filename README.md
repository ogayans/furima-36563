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
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many  :buys

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| text               | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| load_id            | integer    | null: false |
| prefecture_id      | integer    | null: false |
| day_id             | integer    | null: false |
| price              | integer    | null: false |
| user               | references | foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy


## buys テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | foreign_key: true |
| item               | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address

## shipping_addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| prefecture_id      | integer    | null: false |
| municipality       | string     | null: false |
| address            | string     | null: false |
| building_name      | string     |             |
| telephone_number   | string     | null: false |
| buy                | references | foreign_key: true |

### Association

- belongs_to :buy
