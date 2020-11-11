class Drink < ApplicationRecord
    has_many :orders
    #has_many :users, through orders, counter_cache: true
    # (i don't have nested for association yet)
    validates :name, :ingredients, :price, :quantity, presence: true
end
