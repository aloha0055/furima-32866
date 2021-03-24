require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'カラムすべてが存在すれば登録できる' do
      @user.first_name_kana = 'ヒロフミ'
      @user.last_name_kana = 'ハヤシ'
      @user.birthday = '1976/09/21'
      expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      end
      it 'passwordが6文字以上であれば登録できること' do
        @user.first_name_kana = 'ヒロフミ'
        @user.last_name_kana = 'ハヤシ'
        @user.birthday = '1976/09/21'
        @user.password = '123456'
        @user.password_confirmation = '123456'
        expect(@user).to be_valid
      end
    end
      context '新規登録できないとき' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Nickname can't be blank"
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Email can't be blank"
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include ("Password can't be blank")
        end
        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it 'passwordが5文字以下では登録できない' do
          @user.password = '00000'
          @user.password_confirmation = '00000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'emailが＠を含んでいないと登録できない' do
          @user.email = 'hoge.com'
          @user.valid?
          expect(@user.errors.full_messages).to include "Email is invalid"
        end
        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "First name can't be blank"
        end
        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include "Last name can't be blank"
        end
        it 'last_name_kanaが空では登録できない' do
          user = User.new(nickname: 'hiro', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: 'hirofumi', last_name: 'hayashi', first_name_kana: 'ヒロフミ', last_name_kana: '', birthday:'1976/09/21')
          user.valid?
          expect(user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it 'first_name_kanaが空では登録できない' do
          user = User.new(nickname: 'hiro', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: 'hirofumi', last_name: 'hayashi', first_name_kana: '', last_name_kana: 'ハヤシ',birthday:'1976/09/21')
          user.valid?
          expect(user.errors.full_messages).to include("First name kana can't be blank")
        end
        it 'birthdayが空では登録できない' do
          user = User.new(nickname: 'hiro', email: 'test@example', password: '000000', password_confirmation: '000000', first_name: 'hirofumi', last_name: 'hayashi', first_name_kana: 'ヒロフミ', last_name_kana: 'ハヤシ',birthday:'')
          user.valid?
          expect(user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
  end
end