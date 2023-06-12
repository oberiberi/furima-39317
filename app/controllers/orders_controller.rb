class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    return unless @item.buy.present? || current_user.id == @item.user_id

    redirect_to root_path
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :municipality, :address, :building_name, :telephon_number).merge(
      token: params[:token], item_id: @item.id, user_id: current_user.id
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token],     # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
