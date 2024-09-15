class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :create]
  before_action :get_item, only:[:index, :create]
  before_action :move_to_top, only:[:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new()
  end

  def create
    @order_address = OrderAddress.new(params_order)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end

  end

  private
  def get_item
    @item = Item.find(params[:item_id])
  end
  
  def move_to_top
    if user_signed_in? && @item.user_id == current_user.id
      redirect_to root_path
    end

    if user_signed_in? && @item.order != nil
      redirect_to root_path
    end
  end

  def params_order
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number)
    .merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params_order[:token],
      currency: 'jpy'
    )
  end


end

