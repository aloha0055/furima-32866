# README
# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | uniqueness: true, null: false |
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_name_kana    | string              | null: false             |
| last_name_kana     | string              | null: false             |
| birthday           | date                | null: false             |

### Association

* has_many :items
* has_many :comments
* has_many :orders


## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| name                                | string     | null: false       |
| price                               | integer    | null: false       |
| category_id                         | integer    | null: false       |
| condition_id                        | integer    | null: false       |
| text                                | text       | null: false       |
| shipping_charge_id                  | integer    | null: false       |
| shipping_area_id                    | integer    | null: false       |
| estimated_shipping_date_id          | integer    | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one  :order

## orders table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| user                                | references | foreign_key: true |
| item                                | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_address table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| post_code                           | string     | null: false       |
| prefecture_id                       | integer    | null: false       |
| municipal_name                      | string     | null: false       |
| address                             | string     | null: false       |
| building_name                       | string     |                   |
| phone_number                        | string     | null: false       |
| order                               | references | foreign_key: true |

### Association

- belongs_to :order



## comments table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| text        | text       | null: false       |
| item        | references | foreign_key: true |
| user        | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

