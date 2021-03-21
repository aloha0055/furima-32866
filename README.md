# README
# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |
| first_name         | text                | null: false             |
| last_name          | text                | null: false             |
| first_name_kana    | text                | null: false             |
| last_name_kana     | text                | null: false             |
| birth_year         | integer             | null: false             |
| birth_month        | integer             | null: false             |
| birth_day          | integer             | null: false             |

### Association

* has_many :items
* has_many :comments

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| price                               | integer    | null: false       |
| category                            | text       | null: false       |
| condition                           | text       | null: false       |
| text                                | text       | null: false       |
| shipping_charges                    | text       | null: false       |
| shipping_area                       | text       | null: false       |
| Estimated_shipping_date             | text       | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| items       | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user




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