require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー管理機能について' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できる時' do
      it 'ユーザー情報が正しく入力できてる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空の時' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空の時' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが他と被っている時' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空の時' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password_confirmationが空のとき' do
        @user.password = 'ttt555'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが違う時' do
        @user.password_confirmation = 'yyy666'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが英語だけの時' do
        @user.password = 'rrrrrr'
        @user.password_confirmation = 'rrrrrr'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが数字だけの時' do
        @user.password = '777777'
        @user.password_confirmation = '777777'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordが5文字以下の時' do
        @user.password = 'ttt55'
        @user.password_confirmation = 'ttt55'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'last_nameが空の時' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空の時' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角では無いとき' do
        @user.first_name = 'yyy'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it 'last_nameが全角では無いとき' do
        @user.last_name = 'yyy'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end
      it 'last_name_katakanaが空の時' do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it 'first_name_katakanaが空の時' do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it 'last_name_katakanaがカタカナ以外の時' do
        @user.last_name_katakana = 'かた'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name katakana 全角カタカナを使用してください')
      end
      it 'first_name_katakanaがカタカナ以外の時' do
        @user.first_name_katakana = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name katakana 全角カタカナを使用してください')
      end
    end
  end
end
