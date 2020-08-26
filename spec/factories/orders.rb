FactoryBot.define do
  factory :order do
    postal_cord { 123-4567 }
    prefecture_id { 4 }
    city { "横浜市" }
    house_number { "青山１−１" }
    phone { 09012345678 }
  end
end
