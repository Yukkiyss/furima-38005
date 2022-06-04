class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_root_path, only: [:edit]

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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end 

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_price, :item_explanation_id, :category_id, :delivery_chage_id,
                                 :shipment_source_prefecture_id, :send_date_id, :item_detail, :image).merge(user_id: current_user.id)
  end

  def move_to_root_path
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
