class ItemOrder
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :house_number, :building_name, :order, :user, :item, :image
  
  with_options presence: true do
    validates :order_id
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :building_name
  end






  def save
    ShippingAddress.create(post_code: post_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, user_id: user.id)
    Order.create( order_id: order_id, user_id: user.id, item_id: item_id)
  end

end