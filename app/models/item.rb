class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  with_options presence: true do
    validates :name
    validates :text
  end
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :days_to_ship_id
  end
  has_one_attached :image
end
