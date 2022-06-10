class Item < ApplicationRecord
     has_one_attached :image
     belongs_to :genre
     enum item_method: { on_sale: true, stop_selling: false }
end
