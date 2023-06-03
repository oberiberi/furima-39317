class ItemsController < ApplicationController


  def index
    @item = Item.all
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item =Item.create(item_params)
    if @item.save
      redirect_to root_items_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :user, :item_name, :price, :item_category_id, :condition_id, :delivery_price_id, :prefecture_id, :standard_send_date_id, :item_content)
  end
end
