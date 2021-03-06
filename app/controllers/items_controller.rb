class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_params_id, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root_path, only: [:edit, :destroy]

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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_price, :item_explanation_id, :category_id, :delivery_chage_id,
                                 :shipment_source_prefecture_id, :send_date_id, :item_detail, :image).merge(user_id: current_user.id)
  end

  def item_params_id
    @item = Item.find(params[:id])
  end

  def move_to_root_path
    redirect_to root_path if @item.user_id != current_user.id || @item.order.present?
  end
end
