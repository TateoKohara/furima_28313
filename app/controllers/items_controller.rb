class ItemsController < ApplicationController
  # before_action :require_login
  before_action :authenticate_user!, except: [:index]


  def index
  end  
  
  def new
    @item = Item.new
  end

  def create
    # @user = 
    # @item = Item.new
    # if @item.save
    #   redirect_to root_path
    # else 
    #   render :new
    # end    
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
    params.require(:item).permit(:image, :name, :text, :genre_id)
  end
end
