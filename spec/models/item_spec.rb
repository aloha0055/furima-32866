require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品を出品できるとき' do
      it 'カラムすべてが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '写真を入力してください'
      end
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '商品名を入力してください'
      end
      it '商品の説明が空では登録できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '説明文を入力してください'
      end
      it 'カテゴリーが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の種類を入力してください'
      end
      it 'カテゴリーが１では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の種類は1以外の値にしてください'
      end
      it '商品の状態が空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の状態を入力してください'
      end
      it '商品の状態が1では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の状態は1以外の値にしてください'
      end
      it '配送料の負担が空では登録できない' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '送料を入力してください'
      end
      it '配送料の負担が1では登録できない' do
        @item.shipping_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '送料は1以外の値にしてください'
      end
      it '発送元の地域が空では登録できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '発送地域を入力してください'
      end
      it '発送元の地域が1では登録できない' do
        @item.shipping_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '発送地域は1以外の値にしてください'
      end
      it '発送までの日数が空では登録できない' do
        @item.estimated_shipping_date_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '発送までの日数を入力してください'
      end
      it '発送までの日数が1では登録できない' do
        @item.estimated_shipping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '発送までの日数は1以外の値にしてください'
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '値段を入力してください'
      end
      it 'priceが300円以下だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include '値段は一覧にありません'
      end
      it 'priceが9,999,999円以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include '値段は一覧にありません'
      end
      it 'priceが半角数字でないと出品できない' do
        @item.price = '４００'
        @item.valid?
        expect(@item.errors.full_messages).to include '値段は数値で入力してください'
      end
      it 'priceが半角英数混合では登録できないこと' do
        @item.price = '400dollars'
        @item.valid?
        expect(@item.errors.full_messages).to include '値段は数値で入力してください'
      end
      it 'priceが半角英語だけでは登録できないこと' do
        @item.price = 'fivemillion'
        @item.valid?
        expect(@item.errors.full_messages).to include '値段は数値で入力してください'
      end
    end
  end
end
