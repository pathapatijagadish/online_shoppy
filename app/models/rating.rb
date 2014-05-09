class Rating < ActiveRecord::Base
  attr_accessible :product_id, :rating
  belongs_to :product
end
