class Drink < ApplicationRecord
    has_many :orders
    has_many :users, through: :orders, counter_cache: true
    # (i don't have nested for association yet)
    validates :name, :ingredients, :price, presence: true

    def self.show_order_desc
        self.drinks.where(drink_id: @drink.id).order("created_at DESC")
    end
end
