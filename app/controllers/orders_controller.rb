class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  
  def index
    @item = Item.find(params[:item_id])
     @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      # pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end
 
  private

  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :telephon_number).merge(item_id: @item.id, user_id: current_user.id)
  #  parmitにtoken必要？mergeに後でtoken: params[:order], を入力
  end
  
  # def pay_item
  #   Payjp.api_key = "sk_test_24875441b1f558440ef50fab"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  #   Payjp::Charge.create(
  #     amount: item_params[:price] || @item.price,  # 商品の値段
  #     card: order_params[:token] || params[:order][:token],   # カードトークン
  #     currency: 'jpy'                 # 通貨の種類（日本円）
  #   )
  # end

end