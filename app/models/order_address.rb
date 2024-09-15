class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id

  with_options presence: true do
    validates :token, :user_id, :item_id
    validates :item_id
    validates :postal_code, format:{with: /\A[\d]{3}-[\d]{4}\z/, message: "is invalid. Please include hyphen(-)"}
    validates :prefecture_id, numericality:{only_integer: true, other_than: 1, message: "must be selected with the correct item"}
    validates :city, :address
    validates :phone_number, format:{with: /\A\d{10,11}\z/, message:"must be entered correctly"}
  end

  def save
    order = Order.create(token: token, item_id: item_id, user_id: user_id)
    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building: building,
      phone_number: phone_number,
      order_id: order.id
      )
  end

end



