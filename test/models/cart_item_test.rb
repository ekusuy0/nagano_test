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
require "test_helper"

class CartItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
