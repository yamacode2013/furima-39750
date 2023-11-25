class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_history
  has_one_attached :image

  validates :item_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
end