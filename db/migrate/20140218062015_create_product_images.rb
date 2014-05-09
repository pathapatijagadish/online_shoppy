class CreateProductImages < ActiveRecord::Migration
  def change
    create_table :product_images do |t|
    	t.integer :prdocut_id

      t.timestamps
    end
  end
end
