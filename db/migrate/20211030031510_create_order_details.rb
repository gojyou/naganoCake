class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :unit_price
      t.integer :quantity
      t.integer :create_status

      t.timestamps
    end
  end
end
