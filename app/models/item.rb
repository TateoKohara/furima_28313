class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :area
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :comment
    validates :category_id
    validates :charge_id
    validates :status_id
    validates :prefecture_id
    validates :area_id
  end
  
  validates :price, 
  numericality: {only_integer: true, 
  greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}

  belongs_to :user
  has_one :order

end
