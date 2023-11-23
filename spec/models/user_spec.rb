require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '正常系' do
      it 'nicknameとemail、passwordとpassword_confirmation,氏名、フリガナ、誕生日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '異常系' do
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
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it '姓（全角）が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it '名（全角）が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it '姓（カナ）が空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it '名（カナ）が空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it '姓（全角）に半角文字が含まれていると登録できない' do
        user = FactoryBot.build(:user, last_name: '半角文字Included')
        expect(user).not_to be_valid
        expect(user.errors[:last_name]).to include('全角文字を使用してください')
      end
      it '名（全角）に半角文字が含まれていると登録できない' do
        user = FactoryBot.build(:user, first_name: '半角文字Included')
        expect(user).not_to be_valid
        expect(user.errors[:first_name]).to include('全角文字を使用してください')
      end 
      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        user = FactoryBot.build(:user, last_name_kana: 'かな以外の文字')
        expect(user).not_to be_valid
        expect(user.errors[:last_name_kana]).to include('は全角カタカナで入力してください')  
      end 
      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        user = FactoryBot.build(:user, first_name_kana: 'かな以外の文字')
        expect(user).not_to be_valid
        expect(user.errors[:first_name_kana]).to include('は全角カタカナで入力してください')  
      end 
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include ('Password には英字と数字の両方を含めて設定してください')
      end 
      it '数字のみのパスワードでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include ('Password には英字と数字の両方を含めて設定してください')
      end 
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'パスワード123'
        @user.valid?
        expect(@user.errors.full_messages).to include ('Password には英字と数字の両方を含めて設定してください')
      end 
    end
  end
end
