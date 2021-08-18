require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @buy_address = FactoryBot.build(:buy_address)
  end

  describe "商品購入" do
    context '購入できる時' do
      it "全て入力できていると購入できる" do
        expect(@buy_address).to be_valid
      end
      it "building_nameは空でも購入できる" do
        @buy_address.building_name = nil
        expect(@buy_address).to be_valid
      end
    end
    context '購入できないとき' do
      it "postal_codeが空だと購入できない" do
        @buy_address.postal_code = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")  
      end
      it "prefecture_idが1だと購入できない" do
        @buy_address.prefecture_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")  
      end
      it "municipalityが空だと購入できない" do
        @buy_address.municipality = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Municipality can't be blank")  
      end
      it "addressが空だと購入できない" do
        @buy_address.address = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address can't be blank")  
      end
      it "telephone_numberが空だと購入できない" do
        @buy_address.telephone_number = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone number can't be blank")  
      end
      it "postal_codeが数字のみだと購入できない" do
        @buy_address.postal_code = "0000000"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")  
      end
      it "telephone_numberが9桁以下だと購入できない" do
        @buy_address.telephone_number = "000000000"
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone number is too short (minimum is 10 characters)")  
      end
      it "tokenが空では登録できないこと" do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      
    end
  end
end

