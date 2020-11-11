class AddQuantityToDrinkOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :drink_orders, :quantity, :integer
  end
end
