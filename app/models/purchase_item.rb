class PurchaseItem
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly" }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true, message: "Input only number" }
    validates :prefecture_id, numericality: { other_than: 0, message: "Select" }
  end

  def save
    purchase = Purchase.create(user_id: current_user.id, item_id: @item.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end
