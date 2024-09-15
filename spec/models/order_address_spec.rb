require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @order_user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, item_id: @item.id, user_id: @order_user.id)
    sleep(0.5)
  end
  describe '商品購入機能' do
    context '商品購入ができるとき' do
      it '全ての項目が入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空欄でも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'tokenが空なら購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空なら購入できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeがハイフンを含む正しい形式ではない場合は購入できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Please include hyphen(-)')
      end
      it 'prefecture_idが空なら購入できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが半角数字以外のときは購入できない' do
        @order_address.prefecture_id = 'aaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be selected with the correct item')
      end
      it 'prefecture_idが1のときは購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Prefecture must be selected with the correct item')
      end
      it 'cityが空なら購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空なら購入できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空なら購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上11桁以内の半角数値のみではないと購入できない' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number must be entered correctly')
      end
      it 'itemが紐づいていないと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐づいていないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが重複していると登録できない' do
        @order_address.save
        FactoryBot.build(:order_address, item_id: @item.id, user_id: @order_user.id)
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Item has already been taken')
      end
    end
  end
end
