class BuyAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building_name, :telephone_number, :buy_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :municipality, :address, :user_id, :item_id, :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone_number, format: { with: /\A[0-9]+\z/ }, length: { minimum: 10, maximum: 11 }
  end
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building_name: building_name, telephone_number: telephone_number, buy_id: buy.id)
  end
  
end