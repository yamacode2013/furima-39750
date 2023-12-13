FactoryBot.define do
  factory :purchase_shipping do
    post                  {'100-3333'}
    prefecture_id         {'3'}
    city                  {'横浜市'}
    street                {'1丁目'}
    phone                 {'07011114444'}
    token { "tok_abcdefghijk00000000000000000" } 

    association :user
    association :item
  end
end