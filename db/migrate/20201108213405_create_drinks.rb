class CreateDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :ingredients
      t.integer :price
      t.integer :quantity
      t.references :user
      t.references :order

      t.timestamps
    end
  end
end
