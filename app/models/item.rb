class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  has_one_attached :image

  validates :image, :name, :comment,  :category_id,  :charge_id, :status_id, :prefecture_id, :send_id, presence: true

  
end