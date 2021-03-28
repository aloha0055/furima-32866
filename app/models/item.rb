class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :category
  belongs_to :shipping_area
  belongs_to :shipping_charge
  belongs_to :estimated_shipping_date
  belongs_to :user
  # has_many :comments
  # has_one  :order
  has_one_attached :image

  with_options presence: true do
  validates :name
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }, numericality: true
  validates :category_id, numericality: { other_than: 1 }, inclusion: { in: 2..10 }
  validates :condition_id, numericality: { other_than: 1 } 
  validates :text
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :shipping_area_id, numericality: { other_than: 1 } 
  validates :estimated_shipping_date_id, numericality: { other_than: 1 } 
  end

end
