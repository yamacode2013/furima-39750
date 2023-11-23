# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| furigana_family_name | string | null: false |
| furigana_first_name  | string | null: false |
| birth_date              | date   | null: false |

has_many :items
has_many :purchase_histories


## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| description        | text | null: false |
| price              | integer| null: false |
| category_id        | integer| null: false |
| condition_id       | integer| null: false |
| shipping_fee_id    | integer| null: false |
| prefecture_id      | integer| null: false |
| shipping_date_id   | integer| null: false |
| user               |references | null: false, foreign_key: true |

belongs_to :user
has_one :purchase_history


## purchase_histories テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| user            |references | null: false, foreign_key: true |
| item            |references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :shipping_information


## shipping_informations テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| post            |string     | null: false                    |
| prefecture_id   |integer    | null: false                    |
| city            |string     | null: false                    |
| street          |string     | null: false                    |
| building        |string     |                                |
| phone           |string     | null: false                    |
| purchase_histories|references | null: false, foreign_key: true |

belongs_to :purchase_history