class Order < ApplicationRecord

  has_one :adderss
  belongs_to :item

end
