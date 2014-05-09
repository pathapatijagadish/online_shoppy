class CreateProductFeatures < ActiveRecord::Migration
  def change
    create_table :product_features do |t|
      t.string :color
      t.string :size
      t.integer :price
      t.integer :discount
      t.integer :product_id

      t.timestamps
    end
  end
end
