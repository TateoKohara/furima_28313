FactoryBot.define do
  factory :item do
    name { "かわいいネコ" }
    price { 4000 }
    comment { "かわいい猫ちゃんです" }
    category_id { 1 }
    status_id { 2 }
    charge_id { 1 }
    prefecture_id { 1 }
    send_id { 1 }
  end
end
