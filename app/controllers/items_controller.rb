class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]


  def index
  end  
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render "new"
    end  
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :comment, :price, :category_id, :charge_id, :status_id, :prefecture_id, :send_id).merge(user_id: current_user.id)
  end
end
