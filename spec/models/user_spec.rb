require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    it "nickname, email, password, password_confirmation, family_name, first_name, family_name_j, first_name_j, birthが存在すれば登録できること " do
      expect(@user).to be_valid
    end  

    it "passwordが6文字以上で登録できること" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user).to be_valid
    end
    
    it "nicknameが空だと登録できないこと" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    
    it "emailが空だと登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "passwordが空だと登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    
    it "passwordが5文字以下では登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailに@が含まれていないと登録できないこと" do
      @user.email = "hogehoge"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email @を含めてください")
    end  
    
    it "family_nameが空だと登録できないこと" do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end  

    it "first_nameが空だと登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    
    it "family_name_jが空だと登録できないこと" do
      @user.family_name_j = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name j can't be blank")
    end

    it "first_name_jが空だと登録できないこと" do
      @user.first_name_j = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name j can't be blank")
    end

    it "family_nameが全角でないと登録できないこと" do
      @user.family_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
    end

    it "first_nameが全角でないと登録できないこと" do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it "family_name_jが全角カナでないと登録できないこと" do
      @user.family_name_j = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name j 全角カナを使用してください")
    end  

    it "first_name_jが全角カナでないと登録できないこと" do
      @user.first_name_j = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name j 全角カナを使用してください")
    end  

    it "birthが空だと登録できないこと" do
      @user.birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")  
    end

  end  
end

