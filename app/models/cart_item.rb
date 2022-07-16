# == Schema Information
#
# Table name: cart_items
#
#  id          :integer          not null, primary key
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :integer
#  item_id     :integer
#
class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
end
