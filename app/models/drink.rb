class Drink < ApplicationRecord
    has_many :drink_orders
    has_many :users, through: :drink_orders, counter_cache: true
    validates :name, :ingredients, :price, presence: true

    def self.default_scope
        order(:name => "ASC")
    end

    #def self.show_order_desc
    #    self.drinks.where(drink_id: @drink.id).order("created_at AESC")
    #end
end
