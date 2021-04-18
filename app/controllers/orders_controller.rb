class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :contributor_confirmation

  def index
    @item_order = ItemOrder.new
  end
  
  def create
    @item_order = ItemOrder.new(item_order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render action: :index

    end
  end

private

  def item_order_params
    params.require(:item_order).permit( :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: item_order_params[:token], 
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user.id == @item.user
  end
end
