require 'rails_helper'
require 'faker'

RSpec.describe PurchaseShipping, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_shipping = FactoryBot.build(:purchase_shipping, user_id: user.id, item_id: item.id)
    end

      context '正常系' do
        it 'カード情報、配送先情報があれば購入できる'do
          expect(@purchase_shipping).to be_valid
        end
        it 'buildingは空でも保存できること' do
          @purchase_shipping.building = ''
          expect(@purchase_shipping).to be_valid
        end
      end

      context '異常系' do
        it 'カード情報が空だと登録できない'do
          @purchase_shipping.token = '' 
          @purchase_shipping.valid?
          expect(@purchase_shipping.errors.full_messages).to include ("Token can't be blank")
        end
        it '郵便番号がハイフンがないと登録できない'do
          @purchase_shipping.post = '1234567' 
          @purchase_shipping.valid?
          expect(@purchase_shipping.errors.full_messages).to include ("Post is invalid. Include hyphen(-)")
        end
        it '郵便番号が空だと登録できない'do
          @purchase_shipping.post = '' 
          @purchase_shipping.valid?
          expect(@purchase_shipping.errors.full_messages).to include ("Post can't be blank")
        end
        it '都道府県が空だと登録できない'do
          @purchase_shipping.prefecture_id = 1
          @purchase_shipping.valid?
          expect(@purchase_shipping.errors[:prefecture_id]).to include("can't be blank")
        end
        it '市区町村が空だと登録できない'do
          @purchase_shipping.city = ''
          @purchase_shipping.valid?
          expect(@purchase_shipping.errors.full_messages).to include("City can't be blank")
        end
        it '番地が空だと登録できない'do
          @purchase_shipping.street = ''
          @purchase_shipping.valid?
          expect(@purchase_shipping.errors.full_messages).to include("Street can't be blank")
        end
        it '電話番号が空だと登録できない'do
          @purchase_shipping.phone = ''
          @purchase_shipping.valid?
          expect(@purchase_shipping.errors.full_messages).to include("Phone can't be blank")
        end
        it '電話番号が10,11桁以外だと登録できない'do
          @purchase_shipping.phone = '09077777777777777'
          @purchase_shipping.valid?
          expect(@purchase_shipping.errors.full_messages).to include("Phone should be 10 or 11 digits")
        end
        it '電話番号に整数以外が入ると登録できない'do
          @purchase_shipping.phone = '090-1234-5678'
          @purchase_shipping.valid?
          expect(@purchase_shipping.errors.full_messages).to include("Phone should be 10 or 11 digits")
        end

      end
  end
end