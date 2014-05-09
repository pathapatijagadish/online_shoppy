class Brand < ActiveRecord::Base
  attr_accessible :created_by, :description, :status, :title, :updated_by
  has_and_belongs_to_many :categories
  validates :title,:uniqueness=>true
end