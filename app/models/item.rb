class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shopping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  validates :name, :info, presence: true
  validates :category_id, :sales_status_id, :shopping_fee_status_id, :prefecture_id, :scheduled_delivery_id, presence: true, numericality: { only_integer: true, other_than: 1, message: "must be selected with the correct item" }
  validates :price, presence:true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "must be entered with the correct amount" }
  validate :image_presence
  
  private
  def image_presence
    if self.image.attached? == false
      self.errors.add(:image, "can't be blank")
    end
  end

end
