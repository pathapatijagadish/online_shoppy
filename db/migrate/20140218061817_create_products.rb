class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :created_by
      t.string :updated_by
      t.boolean :status
      t.integer :category_brand_id
      t.integer :seller_id
     

      t.timestamps
    end
  end
end
