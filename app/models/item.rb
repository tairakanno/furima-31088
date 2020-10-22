class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  validates :name, :text, :price, presence: true

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :days_to_ship_id
  end

  validates :image, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
