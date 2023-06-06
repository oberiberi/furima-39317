class ItemsController < ApplicationController
  before_action :authenticate_user!,only: [:new, :create]

  # <※ 残す　編集機能で使用>
  # def edit
  #   @item = Item.find(params[:id])
    # unless user_signed_in? && current_user.id == @item.user_id
    #   redirect_to action: :index
  #   end
  # end
  # <※ 残す　編集機能で使用>

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all.order("created_at DESC")
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
    params.require(:item).permit(:image, :item_name, :price, :category_id, :condition_id, :delivery_price_id, :prefecture_id, :standard_send_date_id, :content).merge(user_id: current_user.id)
  end
end