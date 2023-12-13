class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :post, :prefecture_id, :city, :street, :building, :phone, :user_id, :item_id, :token

    validates :post, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city, presence: true
    validates :street, presence: true
    validates :phone, presence: true, format: { with: /\A\d{10,11}\z/, message: "should be 10 or 11 digits" }
    validates :user_id, presence: true
    validates :item_id, presence: true
    validates :token, presence: true

  def save
    purchase_history = PurchaseHistory.create(item_id: item_id, user_id: user_id)
    ShippingInformation.create(post: post, prefecture_id: prefecture_id, city: city, street: street, building: building, phone: phone, purchase_history_id: purchase_history.id)
  end

end 