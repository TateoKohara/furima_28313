class ItemsController < ApplicationController
  # before_action :require_login
  before_action :authenticate_user!, except: [:index]


  def index
  end  
  
  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  # def checked
  # end

  private

  # def require_login
  #   if user_signed_in?
  #     render :items
  #   else  
  #     redirect_to new_user_session_path
  #   end
  # end

  def item_params
    params.require(:item).permit(:image, :name, :comment, :price, :category_id, :charge_id, :status_id, :prefecture_id, :send_id).merge(user_id: current_user.id)
  end
end
