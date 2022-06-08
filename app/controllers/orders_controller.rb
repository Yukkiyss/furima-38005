class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :order_move_to_root_path, only: [:index]

  def index
    @order_domicile = OrderDomicile.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_domicile = OrderDomicile.new(order_params)
    if @order_domicile.valid?
    pay_item
    @order_domicile.save
    return redirect_to root_path
    end
  render 'index'
  end

  def order_params
    params.require(:order_domicile).permit(:postcode, :shipment_source_prefecture_id, :buyer_city, :buyer_block, 
                   :buyer_building,:buyer_phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.item_price,  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

  def order_move_to_root_path
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

end
