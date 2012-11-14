class CreateTixes < ActiveRecord::Migration
  def change
    create_table :tixes do |t|
      t.string :guest_f_name
      t.string :guest_l_name
      t.integer :user_id
      t.integer :user_borrow_id
      t.integer :pool_id

      t.timestamps
    end
  end
end
