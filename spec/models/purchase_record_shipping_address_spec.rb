require 'rails_helper'

RSpec.describe PurchaseRecordShippingAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_record_shipping_address)
    end
    context '保存できる' do
      it '全ての情報があれば保存できる' do
      expect(@purchase_address).to be_valid
      end
    end
    context '保存できない場合' do
      it '郵便番号が空' do
        @purchase_address.postal_code = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号に-ない' do
        @purchase_address.postal_code = "1111111"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号が7桁じゃない' do
        @purchase_address.postal_code = "1111-1111"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '-の位置が違う' do
        @purchase_address.postal_code = "11-11111"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県のidが1番' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が空' do
        @purchase_address.municipality = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空' do
        @purchase_address.address = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空' do
        @purchase_address.phone_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に-がある' do
        @purchase_address.phone_number = "0000000-000"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number ハイフン不要")
      end
      it '電話番号が9桁以下' do
        @purchase_address.postal_code = "000000000"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '電話番号が12桁以上' do
        @purchase_address.postal_code = "000000000000"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'tokenが空' do
        @purchase_address.token = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

    end
end
end
