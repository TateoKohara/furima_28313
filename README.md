# README

# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| family_name   | string | null: false |
| first_name    | string | null: false |
| family_name_j | string | null: false |
| first_name_j  | string | null: false |

### Association

- has_many :items
- has_one :customers

## items  テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| image      | string     | null: false                    |
| price      | integer    | null: false                    |
| comment    | text       | null: false                    |
| category   | string     | null: false                    |
| status     | string     | null: false                    |
| charge     | string     | null: false                    |
| send_place | string     | null: false                    |
| send_days  | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- has_one :sends 
- belongs_to :user

## sends テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| post_number  | string     | null: false                   |
| post_place   | string     | null: false                   |
| city         | string     | null: false                   |
| place_number | integer    | null: false                   |
| building     | string     |                               |
| tell         | string     | null: false                   |
| user         | references | null: false, foreign_key: true|
| item         | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :sends