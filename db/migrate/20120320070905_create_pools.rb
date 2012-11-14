class CreatePools < ActiveRecord::Migration
  def change
    create_table :pools do |t|
      t.string :game
      t.integer :amount
      t.integer :travelling
      t.integer :dressing
      t.integer :b_squad
      t.integer :manager
      t.integer :admin
      t.date :gameday

      t.timestamps
    end
  end
end
