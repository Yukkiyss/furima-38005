require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品情報入力' do
    context '出品登録できる場合' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品登録できない場合' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'item_nameが空だと出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_priceが空だと出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it 'item_explanation_idが未選択だと出品できない' do
        @item.item_explanation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item explanation can't be blank")
      end

      it 'category_idが未選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'delivery_chage_idが未選択だと出品できない' do
        @item.delivery_chage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery chage can't be blank")
      end

      it 'shipment_source_prefecture_idが未選択だと出品できない' do
        @item.shipment_source_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source prefecture can't be blank")
      end

      it 'send_date_idが未選択だと出品できない' do
        @item.send_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Send date can't be blank")
      end

      it 'item_detailが空だと出品できない' do
        @item.item_detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item detail can't be blank")
      end

      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.item_price = '500０'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end

      it '価格が300円未満では出品できない' do
        @item.item_price = '150'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than 300')
      end

      it '価格が9_999_999円を超えると出品できない' do
        @item.item_price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than 9999999')
      end

      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
