class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :post_code,    default: "",  null: false
      t.integer :prefecture, null: false
      t.string :city,           default: ""
      t.string :house_number,   default: ""
      t.string :building_name,  default: ""
      t.references :order,                     null: false,  foreign_key: true
      t.timestamps
    end
  end
end
