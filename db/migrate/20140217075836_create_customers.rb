class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
    	t.string :name
    	t.string :email
    	t.string :password
    	t.string :password_confirmation
    	t.string :mobile_number

      t.timestamps
    end
  end
end
