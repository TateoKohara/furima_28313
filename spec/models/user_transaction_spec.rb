require 'rails_helper'

RSpec.describe UserTransaction, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:user_transaction)
    end
    
    it "postal_code, prefecture, city, house_number, phoneが存在すれば購入できること" do
      expect(@order).to be_valid
    end

    it "郵便番号が空だと購入できないこと" do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it "郵便番号がハイフン込みの7桁の数字でないと購入できないこと" do
      @order.postal_code = "123456"
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code ハイフン込みの7桁の数字で入力してください")
    end

    it "発送地域が選択されていないと購入できないこと" do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it "市町村が空だと購入できないこと" do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it "市町村が全角でないと購入できないこと" do
      @order.city = "ﾖｺﾊﾏｼ"
      @order.valid?
      expect(@order.errors.full_messages).to include("City 全角で入力してください")
    end

    it "番地が空だと購入できないこと" do
      @order.house_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("House number can't be blank")
    end

    it "番地が全角でないと購入できないこと" do
      @order.house_number = "ｱｵﾔﾏ1-1"
      @order.valid?
      expect(@order.errors.full_messages).to include("House number 全角で入力してください")
    end

    it "電話番号が空だと購入できないこと" do
      @order.phone = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone can't be blank")
    end

    it "電話番号がハイフンなしの11桁であること" do
      @order.phone = "090-1234-5678"
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone ハイフンなしの11桁で入力してください")
    end

  end
end
