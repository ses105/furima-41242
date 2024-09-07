class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_item)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_item
    params.require(:item).permit(:name, :info, :price, :image, :category_id, :sales_status_id, :shopping_fee_status_id,
                                 :prefecture_id, :scheduled_delivery_id).merge(user_id: current_user.id)
  end
end
