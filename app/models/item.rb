class Item < ApplicationRecord
  belongs_to :user
  # has_one :purchase_history
  has_one_attached :image

  validates :item_name, presence: true, length: { maximum: 40 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, foreign_key: 'category_id'
  belongs_to :condition, foreign_key: 'condition_id'
  belongs_to :shipping_fee, foreign_key: 'shipping_fee_id'
  belongs_to :shipping_date, foreign_key: 'shipping_date_id'
  belongs_to :prefecture, foreign_key: 'prefecture_id'

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
end