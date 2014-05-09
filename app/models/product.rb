class Product < ActiveRecord::Base
  attr_accessible :created_by, :description, :status, :title, :updated_by,:category_brand_id,:seller_id
  belongs_to :category_brand
  belongs_to :seller
  has_many :product_images
  has_many :ratings
  has_one :product_feature
end
