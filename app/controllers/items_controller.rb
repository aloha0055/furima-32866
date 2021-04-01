class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @items = Item.order('created_at DESC').includes(:user)
    # binding.pry
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category_id, :condition_id, :text, :shipping_charge_id, :shipping_area_id,
                                 :estimated_shipping_date_id, :image).merge(user_id: current_user.id)
  end
end
