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
    validates :image
    validates :text
  end

  with_options presence: true, numericality: { other_than: 1} do
    validates :category_id, inclusion: { in: 2..10 }
    validates :condition_id
    validates :shipping_charge_id
    validates :shipping_area_id
  end

  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }, numericality: true, presence: true

  def was_attached?
    self.image.attached?
  end

end
