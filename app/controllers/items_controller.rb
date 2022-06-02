class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all.order(created_at: :desc)
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
    params.require(:item).permit(:item_name, :item_price, :item_explanation_id, :category_id, :delivery_chage_id,
                                 :shipment_source_prefecture_id, :send_date_id, :item_detail, :image).merge(user_id: current_user.id)
  end
end
