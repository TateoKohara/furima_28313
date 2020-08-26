class UserTransaction

  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフン込みの7桁の数字で入力してください"}
    validates :prefecture_id
    validates :city, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください"}
    validates :house_number, format: {with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力してください"}
    validates :phone, format: {with: /\A\d{11}\z/, message: "ハイフンなしの11桁で入力したください"}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone: phone,)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone: phone, user_id: user_id, item_id: item_id)
  end

end
