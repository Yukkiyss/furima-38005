class OrdersController < ApplicationController

  def index
    @order_domicile = OrderDomicile.new
    @item = Item.find(params[:item_id])
  end

  def create
    binding.pry
    @order_domicile = OrderDomicile.new(order_params)
    @order_domicile.save
  end

  def order_params
    params.require(:order_domicile).permit(:postcode, :shipment_source_prefecture_id, :buyer_city, :buyer_block, 
                   :buyer_building,:buyer_phone_number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
