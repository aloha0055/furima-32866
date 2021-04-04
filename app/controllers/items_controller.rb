class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :create, :update]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update]

  def index
    @items = Item.order('created_at DESC').includes(:user)
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:id,:name, :price, :category_id, :condition_id, :text, :shipping_charge_id, :shipping_area_id,:estimated_shipping_date_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end
end
