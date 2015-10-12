class Offer < ActiveRecord::Base
  belongs_to :product
  belongs_to :available_product, -> { where(available: true) },
             class_name:  'Product',
             foreign_key: :product_id
end
