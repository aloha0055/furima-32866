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

  validates :name, presence: true
  validates :price, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }   
  validates :condition_id, presence: true, numericality: { other_than: 1 } 
  validates :text, presence: true
  validates :shipping_charge_id, presence: true, numericality: { other_than: 1 } 
  validates :shipping_area_id, presence: true, numericality: { other_than: 1 } 
  validates :estimated_shipping_date_id, presence: true, numericality: { other_than: 1 } 

end
