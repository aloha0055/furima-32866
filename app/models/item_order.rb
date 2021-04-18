class ItemOrder
  include ActiveModel::Model
  
  # attr_accessorの記入はカラム名を入力
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token


  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, length: { maximum: 11 }, numericality: { only_integer: true }

  end

  def save
   order = Order.create(user_id: user_id, item_id: item_id)
   ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number,order_id: order.id)
  
  end
end