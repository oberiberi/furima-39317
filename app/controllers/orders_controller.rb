class OrdersController < ApplicationController
 
  def index
    @item = Item.find(params[:item_id])
     @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end
 
  private

  def order_params
    params.require(:order).permit(:card_number, :expiration_date_month, :expiration_date_year, :security_code, :post_code, :prefecture_id, :municipality, :address, :building_name, :telephon_number, :user_id, :item_id).merge(user_id: current_user.id)
  end
end