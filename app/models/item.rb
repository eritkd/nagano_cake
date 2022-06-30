class Item < ApplicationRecord
     has_one_attached :image
     belongs_to :genre
     has_many :cart_items
     
     enum item_method: { on_sale: true, stop_selling: false }
     
       def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
end
