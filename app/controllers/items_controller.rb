class ItemsController < ApplicationController
  before_action :authenticate_user! , except: [:index]

  def index
  end

  def new
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :item_price, :item_detail, :image).merge(user_id: current_user.id)
  end

end
