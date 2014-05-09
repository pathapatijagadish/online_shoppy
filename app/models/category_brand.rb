class CategoryBrand < ActiveRecord::Base
  attr_accessible :brand_id, :category_id
  has_many :products
  belongs_to :seller
  belongs_to :brand
  belongs_to :category
end
