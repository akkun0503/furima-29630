require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "新規商品出品" do
    it "image、name、info、category_id、sales_status_id、shipping_fee_status_id、prefecture_id、scheduled_delivery_id、priceが存在すれば登録できること" do
      expect(@item).to be_valid
    end
      
    it "imageが空では出品できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "nameが空では出品できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "infoが空では出品できないこと" do
      @item.info = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Info can't be blank")
    end

    it "category_idが1では出品できないこと" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it "sales_status_idが1では出品できないこと" do
      @item.sales_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Sales status Select")
    end
    
    it "shipping_fee_status_idが1では出品できないこと" do
      @item.shipping_fee_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee status Select")
    end

    it "prefecture_idが1では出品できないこと" do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Select")
    end

    it "scheduled_delivery_idが1では出品できないこと" do
      @item.scheduled_delivery_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery Select")
    end

    it "priceが空では出品できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceに英文字が混じっていると出品できないこと" do
      @item.price = "333ABC"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "priceに平仮名が混じっていると出品できないこと" do
      @item.price = "333えお"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "priceにカタカナが混じっていると出品できないこと" do
      @item.price = "333エオ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "priceに漢字が混じっていると出品できないこと" do
      @item.price = "333一二"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "priceに大文字数字が混じっていると出品できないこと" do
      @item.price = "333１２"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "priceが半角英語だけでは出品できないこと" do
      @item.price = "aaaaa"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "priceが300未満では出品できないこと" do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceが9999999より大きいと出品できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end
  end
end
