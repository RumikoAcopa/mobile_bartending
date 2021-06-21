class Drink < ApplicationRecord
    has_many :drink_orders
    has_many :users, through: :drink_orders, counter_cache: true
    validates :name, :ingredients, :price, presence: true

    def self.default_scope
        order(:name => "ASC")
    end

end
