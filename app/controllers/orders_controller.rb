class OrdersController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @order = Order.new()
  end

  def create
    @order = Order.new(params_order)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index, status: :unprocessable_entity
    end

  end

  private
  def params_order
    params.require(:order).permit().merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @order.item.price,
      card: params_order[:token],
      currency: 'jpy'
    )
  end
end
