class CreateDrinkOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :drink_orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :drink, null: false, foreign_key: true
      t.string :special_instructions

      t.timestamps
    end
  end
end
