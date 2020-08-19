class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :comment
    validates :category_id
    validates :charge_id
    validates :status_id
    validates :prefecture_id
    validates :send_id
  end
  
  validates :price, 
  numericality: {only_integer: true, 
  greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}
  

end