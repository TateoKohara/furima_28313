class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre

  validates :image, :name, :comment, :genre, presence: true

  validates :genre_id, numericality: { other_than: 1 }
end