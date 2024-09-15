class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address

  attr_accessor :token

  validates :item_id, uniqueness: true
end
