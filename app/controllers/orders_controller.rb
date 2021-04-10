class OrdersController < ApplicationController
  def index
    @item_order = ItemOrder.new
    @item_order = Item.find(params[:item_id])
  end

  def create
    @item_order = ItemOrder.new(item_order_params)
    if @item_order_donation.valid?
      @item_order_donation.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def item_order_params
    params.require(:item_order).permit(:name, :price, :category, :condition, :text, :image, :shipping_charge, :shipping_area, :estimated_shipping_date, :building_name,:post_code, :prefecture, :city, :house_number, :building_name, :order, :user, :item, :image)
  end
end
