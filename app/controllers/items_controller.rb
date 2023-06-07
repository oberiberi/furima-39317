class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def destroy
    return unless @item.destroy

    redirect_to root_path
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def edit
    return unless current_user.id != @item.user_id

    redirect_to root_path
  end

  def show
  end

  def index
    @items = Item.all.order('created_at DESC')
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

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :item_name, :price, :category_id, :condition_id, :delivery_price_id, :prefecture_id,
                                 :standard_send_date_id, :content).merge(user_id: current_user.id)
  end
end
