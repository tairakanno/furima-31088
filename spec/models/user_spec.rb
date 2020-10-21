require 'rails_helper'

RSpec.describe User, type: :model do
  
  
describe "ユーザー管理機能について" do
  before do
    @user = FactoryBot.build(:user)
  end
context "新規登録できる時" do
it "ユーザー情報が正しく入力できてる" do
  expect(@user).to be_valid
end
end
context "新規登録できない時"　do
  it "nicknameが空の時"　do
    @user.nickname = ""
    @user.valid?
    binding.pry
  end
  it "emailが空の時"　do
  end
  it "emailが他と被っている時"　do
  end
  it "passwordが空の時"　do
  end
  it "password_confirmationが空のとき" do
  end
  it "passwordとpassword_confirmationが違う時" do
  end
  it "passwordが英語だけの時" do
  end
  it "passwordが数字だけの時" do
  end
  it "last_nameが空の時" do
  end
  it "first_nameが空の時" do
  end
  it "last_name_katakanaが空の時" do
  end
  it "first_name_katakanaが空の時" do
  end
  it "last_name_katakanaがカタカナ以外の時" do
  end
  it "first_name_katakanaがカタカナ以外の時" do
  end
end


end
end
