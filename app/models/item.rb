class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_history
  has_one_attached :image
  belongs_to :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_date, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture, numericality: { other_than: 1 , message: "can't be blank"}
end