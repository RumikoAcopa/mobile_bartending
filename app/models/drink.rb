class Drink < ApplicationRecord
    belongs_to :user
    #belongs_to :order (i don't have nested for association yet)
    validates :name, :ingredients, :price, :quantity, presence: true
end
