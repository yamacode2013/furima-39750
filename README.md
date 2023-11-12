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
| email              | string | null: false |
| encrypted_password | string | null: false |
| full_name          | string | null: false |
| birth              | integer| null: false |
| address            | integer| null: false |

has_many :items
has_many :shipping_information
belongs_to :purchase_history


## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| price              | string | null: false |
| condition          | string | null: false |
| shipping_cost      | integer| null: false |
| region             | string | null: false |
| shipping_date      | integer| null: false |

belongs_to :user
belongs_to :purchase_history


## purchase_history テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| user_id            |references | null: false, foreign_key: true |
| item _id           |references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
belongs_to :shipping_information


## shipping_information テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| user_id            |references | null: false, foreign_key: true |
| item_id            |references | null: false, foreign_key: true |
| address            |string     | null: false                    |
| card               |integer    | null: false                    |
| phone              |integer    | null: false                    |

belongs_to :user
belongs_to :item
belongs_to :purchase_history