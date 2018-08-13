class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :number
      t.float :weight
      t.float :price
      t.date :date_made
      t.date :date_completed
      t.date :date_picked_up
      t.string :comments
      t.integer :user_id
    end
  end
end
