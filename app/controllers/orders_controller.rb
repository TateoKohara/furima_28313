class OrdersController < ApplicationController
  before_action :set_item, only:[:index, :create]
  

  def index
  end
  
  def create
    @order = UserTransaction.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render "index"
    end  
  end
  
  private

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone, :item_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end  

end
