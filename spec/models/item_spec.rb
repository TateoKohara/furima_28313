require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it "name, image, price, comment, category, status, charge, prefecture, sendが入力されていれば出品できる" do
      expect(@item).to be_valid
    end
    
    it "商品名が空だとと出品できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    # It "商品名が41文字以上だと出品できない" do
    #   @item.comment = "41"
    #   @item.valid?
    #   expect(@item.errors.full_messages).to include("41文字未満で設定してください")
    # end  
    
    it "商品の画像が空だと出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    
    # it "販売価格が0だと出品できない" do
    #   @item.price = nil
    #   @item.valid?
    #   expect(@item.errors.full_messages).to include("Price can't be blank")
    # end

    # it "販売価格が300円未満だと出品できない" do
    #   @item.price < 300
    #   @item.valid?
    #   expect(@item.errors.full_messages).to include("300円以上に設定してください")
    # end
    
    # it "販売価格が10,000,000,000円以上だと出品できない" do
    #   @item.price < 10000000000
    #   @item.valid?
    #   expect(@item.errors.full_messages).to include("10,000,000,000円未満に設定してください")
    # end
    
    it "商品説明が空だと出品できない" do
      @item.comment = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Comment can't be blank")
    end

    # it "商品説明が1,001文字以上だと出品できない" do
    #   @item.comment < 1001
    #   @item.valid?
    #   expect(@item.errors.full_messages).to include("1,001文字未満に設定してください")
    # end

    it "カテゴリーが選択されていないと出品できない" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "商品の状態が選択されていないと出品できない" do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    
    it "配送料の負担が選択されていないと出品できない" do
      @item.charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Charge can't be blank")
    end
    
    it "発送元の地域が選択されたいないと出品できない" do
      @item.prefecture_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    
    it "発送までの日数が選択されていないと出品できない" do
      @item.send_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Send can't be blank")
    end  
  end  
end
