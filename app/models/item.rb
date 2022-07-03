class Item < ApplicationRecord
     has_one_attached :image
     belongs_to :genre
     has_many :cart_items
     has_many :order_details
     
     enum item_method: { on_sale: true, stop_selling: false }
     
     def with_tax_price
    (price * 1.1).floor
    end
     
       def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
