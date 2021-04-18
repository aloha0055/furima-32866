require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  describe '商品出品登録' do
    context '商品を出品できるとき' do
      it 'カラムすべてが存在すれば登録できる' do
        expect(@item_order).to be_valid
      end
    end

    context '出品できないとき' do
      it 'ユーザーIDが空では登録できない' do
        @item_order.user_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Userを入力してください'
      end
      it 'item_idが空では登録できない' do
        @item_order.item_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Itemを入力してください'
      end
      it '郵便番号が空では登録できない' do
        @item_order.post_code = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Post codeを入力してください'
      end
      it '郵便番号に−が含まれていないと登録できない' do
        @item_order.post_code = '8140032'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Post codeis invalid. Include hyphen(-)'
      end
      it '県が空では登録できない' do
        @item_order.prefecture_id = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Prefectureを入力してください'
      end
      it '市町村が空では登録できない' do
        @item_order.city = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Cityを入力してください'
      end
      it '番地が空では登録できない' do
        @item_order.house_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'House numberを入力してください'
      end
      it '電話番号が空では登録できない' do
        @item_order.phone_number = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Phone numberを入力してください'
      end
      it '電話番号が空では登録できない' do
        @item_order.phone_number = '1234567890'
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Phone numberは11文字以上で入力してください'
      end
      it 'tokenが空では登録できない' do
        @item_order.token = nil
        @item_order.valid?
        expect(@item_order.errors.full_messages).to include 'Tokenを入力してください'
      end

    end
  end
end