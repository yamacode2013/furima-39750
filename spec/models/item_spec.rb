require 'rails_helper'
require 'faker'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '正常系' do
      it '商品画像、商品名、商品の説明、商品の詳細、配送について、販売価格が存在すれば出品できる'do
        expect(@item).to be_valid
      end
    end
    context '異常系' do
      it 'item_nameが空だと登録できない'do
        @item.item_name = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item name can't be blank")
      end
      it 'descriptionが空だと登録できない'do
        @item.description = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include ("Description can't be blank")
      end
      it 'priceが空だと登録できない'do
        @item.price = '' 
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it '商品名が41文字以上だと登録できない'do
        long_item_name = 'a' * 41
        item = Item.new(item_name: long_item_name)
        item.valid?
        expect(item.errors[:item_name]).to include('is too long (maximum is 40 characters)')
      end
      it '商品説明が1001文字以上だと登録できない'do
        long_description = 'a' * 1001
        item = Item.new(description: long_description)
        item.valid?
        expect(item.errors[:description]).to include('is too long (maximum is 1000 characters)')
      end
      it 'カテゴリーが"---"だと登録できない'do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include("can't be blank")
      end
      it '商品の状態が"---"だと登録できない'do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors[:condition_id]).to include("can't be blank")
      end
      it '配送料の負担が"---"だと登録できない'do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors[:shipping_fee_id]).to include("can't be blank")
      end
      it '発送までの日数が"---"だと登録できない'do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors[:shipping_date_id]).to include("can't be blank")
      end
      it '発送元の地域が"---"だと登録できない'do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include("can't be blank")
      end
    end
  end

end
