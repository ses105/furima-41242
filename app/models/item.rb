class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shopping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :category_id, :sales_status_id, :shopping_fee_status, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 1, message: "can't be blank" }

end
