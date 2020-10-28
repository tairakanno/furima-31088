require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '新規投稿について' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '新規投稿できる時' do
      it '全部の情報が入力できている' do
        expect(@item).to be_valid
      end
      it '建物名がなくてもいい' do
        @item.building_name = ""
        expect(@item.errors.full_messages).to be_valid
      end
    end

    context '新規投稿できない時' do
      it 'name情報が空' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが空' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが空' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'delivery_cost_idが空' do
        @item.delivery_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery cost must be other than 1')
      end
      it 'prefecture_idが空' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'days_to_ship_idが空' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to ship must be other than 1')
      end
      it 'priceが空' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円以下' do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが9999999円以上' do
        @item.price = 111_111_111_111_111
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'userと紐づいていないといけない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
