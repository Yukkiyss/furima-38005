class ItemsController < ApplicationController
  def index
  end

  private
  def prototype_params
    params.require(:item).permit(:item_name, :item_price, :item_detail, :image).merge(user_id: current_user.id)
  end

end
