class TransactionsController < ApplicationController

  def index
  end
  
  def creste
    @transaction = Transaction.new(price: transaction_params[:price])
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render "index"
    end  
  end
  
  private

  def transaction_params
    params.permid(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAY_SECRET_KEY"]
    Payjp::Charge.create(
      amount: transaction_params[:price],
      card: transaction_params[:token],
      currency:'jpy'
    )
  end  

end
