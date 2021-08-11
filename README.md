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
- has_one  :buyer

## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| text               | text       | null: false |
| category           | string     | null: false |
| condition          | string     | null: false |
| load               | string     | null: false |
| area               | string     | null: false |
| days               | string     | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy


## buyers テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address

## shipping_addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| postal_code        | string     | null: false |
| prefectures        | string     | null: false |
| municipalities     | string     | null: false |
| address            | string     | null: false |
| building_name      | string     |
| telephone_number   | integer    | null: false |
| buy                | references | null: false, foreign_key: true |

### Association

- belongs_to :buy