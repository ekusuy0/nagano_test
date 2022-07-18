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
class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :ordered_items, dependent: :destroy

  has_one_attached :item_image


  def get_item_image
    if item_image.attached?
      item_image
    else
      'no_image.jpg'
    end
  end

  def tax
    (price * 1.1).floor
  end
end
