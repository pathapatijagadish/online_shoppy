class ProductFeature < ActiveRecord::Base
  attr_accessible :color, :discount, :price, :size
  belongs_to :product
end
