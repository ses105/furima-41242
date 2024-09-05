require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品投稿機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品の投稿ができるとき' do
      it '全ての項目が正しく入力されているときは投稿できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の投稿ができないとき' do
      it 'nameが空のときは投稿できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが空のときは投稿できない' do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'priceが空のときは投稿できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字以外のときは投稿できない' do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be entered with the correct amount")
      end
      it 'priceが300未満のときは投稿できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be entered with the correct amount")
      end
      it 'priceが9999999より大きいときは投稿できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be entered with the correct amount")
      end
      it 'category_idが空のときは投稿できない' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idが半角数字以外のときは投稿できない' do
        @item.category_id = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be selected with the correct item")
      end
      it 'category_idが1のときは投稿できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be selected with the correct item")
      end
      it 'sales_status_idが空のときは投稿できない' do
        @item.sales_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end
      it 'sales_status_idが半角数字以外のときは投稿できない' do
        @item.sales_status_id = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status must be selected with the correct item")
      end
      it 'sales_status_idが1のときは投稿できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status must be selected with the correct item")
      end
      it 'shopping_fee_status_idが空のときは投稿できない' do
        @item.shopping_fee_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping fee status can't be blank")
      end
      it 'shopping_fee_status_idが半角数字以外のときは投稿できない' do
        @item.shopping_fee_status_id = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping fee status must be selected with the correct item")
      end
      it 'shopping_fee_status_idが1のときは投稿できない' do
        @item.shopping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping fee status must be selected with the correct item")
      end
      it 'prefecture_idが空のときは投稿できない' do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが半角数字以外のときは投稿できない' do
        @item.prefecture_id = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be selected with the correct item")
      end
      it 'prefecture_idが1のときは投稿できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be selected with the correct item")
      end
      it 'scheduled_delivery_idが空のときは投稿できない' do
        @item.scheduled_delivery_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it 'scheduled_delivery_idが半角数字以外のときは投稿できない' do
        @item.scheduled_delivery_id = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be selected with the correct item")
      end
      it 'scheduled_delivery_idが1のときは投稿できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be selected with the correct item")
      end
      it 'imageが空のときは投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐づいていないと投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end

  end

end
