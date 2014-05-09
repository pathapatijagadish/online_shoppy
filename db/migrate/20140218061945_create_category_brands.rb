class CreateCategoryBrands < ActiveRecord::Migration
  def change
    create_table :category_brands do |t|
      t.integer :category_id
      t.integer :brand_id
      t.integer :seller_id

      t.timestamps
    end
    def up
    	remove_column :category_brands, :seller_id,:integer
    end
  end
end
