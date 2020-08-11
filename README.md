# README

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_one :customers

## items  テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| item     | string     | null: false                    |
| image    | string     | null: false                    |
| price    | integer    | null: false                    |
| comment  | text       | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- has_one :customers
- belongs_to :users

## customers テーブル

| Column  | Type       | Options                        |
| ------- | -------    | ------------------------------ |
| card    | integer    | null: false                    |
| limit_m | integer    | null: false                    |
| limit_y | integer    | null: false                    |
| cord    | integer    | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- has_one :sends
- belongs_to :items

## sends テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| post_number  | integer | null: false |
| city         | string  | null: false |
| place_number | integer | null: false |
| building     | string  | null: false |
| tell         | integer | null: false |

### Association

- belongs_to :customers