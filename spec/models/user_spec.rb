require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'カラムすべてが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '123aaa'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "メールアドレスを入力してください"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "確認用パスワードとパスワードの入力が一致しません"
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードとパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'AA000'
        @user.password_confirmation = 'AA000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'emailが＠を含んでいないと登録できない' do
        @user.email = 'hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'メールアドレスは不正な値です'
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名前を入力してください"
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名字を入力してください"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カナ）を入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end
      it 'passwordは英語のみでは登録できないこと' do
        @user.password = 'AAAAAA'
        @user.password_confirmation = 'AAAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'passwordは数字のみでは登録できないこと' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'passwordは全角では登録できないこと' do
        @user.password = '１１１１１１'
        @user.password_confirmation = '１１１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
      end
      it 'first_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.first_name = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it 'last_nameが漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.last_name = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字は不正な値です")
      end
      it 'first_name_kanaが全角カタカナ以外では登録できないこと' do
        @user.first_name_kana = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）は不正な値です")
      end
      it 'last_name_kanaが全角カタカナ以外では登録できないこと' do
        @user.last_name_kana = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("名字（カナ）は不正な値です")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end

    end
  end
end
