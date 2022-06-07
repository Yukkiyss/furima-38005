require 'rails_helper'

RSpec.describe OrderDomicile, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_domicile = FactoryBot.build(:order_domicile, user_id: user.id, item_id: item.id)

  end

  describe '商品購入機能' do
    context '出品購入ができる場合' do
      it '全ての項目が入力されていれば購入できる' do
        expect(@order_domicile).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it '郵便番号が空だと購入できない' do
        @order_domicile.postcode = ''
        @order_domicile.valid?
        expect(@order_domicile.errors.full_messages).to include("Postcode can't be blank")
      end

      it '都道府県が未選択だと購入できない' do
        @order_domicile.shipment_source_prefecture_id = 1
        @order_domicile.valid?
        expect(@order_domicile.errors.full_messages).to include("Shipment source prefecture can't be blank")
      end

      it '市区町村が空だと購入できない' do
        @order_domicile.buyer_city = ''
        @order_domicile.valid?
        expect(@order_domicile.errors.full_messages).to include("Buyer city can't be blank")
      end

      it '番地が空だと購入できない' do
        @order_domicile.buyer_city = ''
        @order_domicile.valid?
        expect(@order_domicile.errors.full_messages).to include("Buyer city can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @order_domicile.buyer_phone_number = ''
        @order_domicile.valid?
        expect(@order_domicile.errors.full_messages).to include("Buyer phone number can't be blank")
      end

    end
  end
end
