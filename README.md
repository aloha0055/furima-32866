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
* has_many :orders


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
| estimated_shipping_date             | text       | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one  :order

## orders table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| credit_number                       | integer    | null: false       |
| expiration_date_month               | integer    | null: false       |
| expiration_date_year                | integer    | null: false       |
| security_code                       | integer    | null: false       |
| user                                | references | foreign_key: true |
| items                               | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_address table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| post_code                           | integer    | null: false       |
| prefectures                         | string     | null: false       |
| municipal_name                      | string     | null: false       |
| address                             | string     | null: false       |
| address                             | string     | null: false       |
| building_name                       | string     | null: false       |
| phone-number                        | integer    | null: false       |


### Association

- belongs_to :order



## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| items       | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

