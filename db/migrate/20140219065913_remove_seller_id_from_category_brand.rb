class RemoveSellerIdFromCategoryBrand < ActiveRecord::Migration
  def up
    remove_column :category_brands, :seller_id
  end

  def down
    add_column :category_brands, :seller_id, :integer
  end
end
