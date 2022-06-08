class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :order_item_params_id, only: [:index, :create]
  before_action :order_move_to_root_path, only: [:index]

  def index
    @order_domicile = OrderDomicile.new
  end

  def create
    @order_domicile = OrderDomicile.new(order_params)
    if @order_domicile.valid?
      pay_item
      @order_domicile.save
      return redirect_to root_path
    end
    render 'index'
  end

  private

  def order_params
    params.require(:order_domicile).permit(:postcode, :shipment_source_prefecture_id, :buyer_city, :buyer_block,
                                           :buyer_building, :buyer_phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order_item_params_id
    @item = Item.find(params[:item_id])
  end

  def order_move_to_root_path
    redirect_to root_path if @item.user_id == current_user.id || @item.order.present?
  end
end
