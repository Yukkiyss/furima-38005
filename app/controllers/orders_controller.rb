class OrdersController < ApplicationController

  def index
    @order_domicile = OrderDomicile.new
    @item = Item.find(params[:item_id])
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @order_domicile = OrderDomicile.new(order_params)
    if @order_domicile.valid?
    @order_domicile.save
    return redirect_to root_path
    end
  render 'index'
  end

  def order_params
    params.require(:order_domicile).permit(:postcode, :shipment_source_prefecture_id, :buyer_city, :buyer_block, 
                   :buyer_building,:buyer_phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
