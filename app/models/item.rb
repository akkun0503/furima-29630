class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :sales_status, :shipping_fee_status, :prefecture, :scheduled_fee_status

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
    validates :price, numericality: { grater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
      with_options numericality: { other_than: 1 } do
        validates :category_id
        validates :sales_status_id
        validates :shipping_fee_status_id
        validates :prefecture_id
        validates :scheduled_delivery_id
      end
  end
end