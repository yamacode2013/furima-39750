FactoryBot.define do
  factory :item do
    item_name             {'あいうえお'}
    description           {'これは商品の説明です'}
    price                 {'5000'}
    category_id           {'3'}
    condition_id          {'3'}
    shipping_fee_id       {'3'}
    shipping_date_id      {'3'}
    prefecture_id         {'3'}

    user { FactoryBot.create(:user) }
  end
end