class AddColumnToDrinkOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :drink_orders, :name, :string
  end
end
