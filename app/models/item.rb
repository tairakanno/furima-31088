class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category


  validates :title, :text, :genre, presence: true

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_cost_id
    validates :prefecture_id
    validates :days_to_ship_id
  end

 
end
