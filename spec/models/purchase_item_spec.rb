require 'rails_helper'

RSpec.describe PurchaseItem, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
      @purchase_item = FactoryBot.build(:purchase_item, user_id: user.id, item_id: item.id)
  end

  describe '商品購入者情報の保存' do
  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@purchase_item).to be_valid
  end

  it '建物名が入力されていなくてもその他の項目が正しく入力されていれば保存できること' do
    @purchase_item.building = nil
    expect(@purchase_item).to be_valid
  end

  it 'postal_codeが空だと保存できないこと' do
    @purchase_item.postal_code = nil
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("Postal code can't be blank")
  end

  it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @purchase_item.postal_code = '1234567'
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("Postal code Input correctly")
  end

  it "prefecture_idが1では出品できないこと" do
    @purchase_item.prefecture_id = 1
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("Prefecture Select")
  end

  it 'cityが空だと保存できないこと' do
    @purchase_item.city = nil
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("City can't be blank")
  end

  it 'addressが空だと保存できないこと' do
    @purchase_item.address = nil
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("Address can't be blank")
  end

  it 'phone_numberが空だと保存できないこと' do
    @purchase_item.phone_number = nil
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("Phone number can't be blank")
  end

  it 'phone_numberが12桁以上だと保存できないこと' do
    @purchase_item.phone_number = '090123456789'
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
  end

  it "phone_numberに英文字が混じっていると保存できないこと" do
    @purchase_item.phone_number = "333ABC"
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("Phone number Input only number")
  end

  it "phone_numberに平仮名が混じっていると保存できないこと" do
    @purchase_item.phone_number = "333えお"
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("Phone number Input only number")
  end

  it "phone_numberにカタカナが混じっていると保存できないこと" do
    @purchase_item.phone_number = "333エオ"
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("Phone number Input only number")
  end

  it "phone_numberに漢字が混じっていると保存できないこと" do
    @purchase_item.phone_number = "333一二"
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("Phone number Input only number")
  end

  it "phone_numberに大文字数字が混じっていると保存できないこと" do
    @purchase_item.phone_number = "333１２"
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("Phone number Input only number")
  end

  it "phone_numberが半角英語だけでは保存できないこと" do
    @purchase_item.phone_number = "aaaaa"
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("Phone number Input only number")
  end

  it 'tokenが空だと保存できないこと' do
    @purchase_item.token = nil
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("Token can't be blank")
  end

  it 'user_idが空だと保存できないこと' do
    @purchase_item.user_id = nil
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("User can't be blank")
  end

  it 'item_idが空だと保存できないこと' do
    @purchase_item.item_id = nil
    @purchase_item.valid?
    expect(@purchase_item.errors.full_messages).to include("Item can't be blank")
  end

  end
  
end
