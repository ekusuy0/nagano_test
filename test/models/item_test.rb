# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  price       :integer
#  sale_status :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  genre_id    :integer
#
require "test_helper"

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
