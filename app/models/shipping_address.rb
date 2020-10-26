class ShippingAddress < ApplicationRecord
  belongs_to :purchase_record
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  # with_options presence: true do
  #   validates :postal_code
  #   validates :text
  # end
  with_options presence: true, numericality: { other_than: 1 } do
    validates :prefecture
  end

end
