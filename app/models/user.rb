class User < ApplicationRecord
  has_many :drink_orders
  has_many :drinks, through: :drink_orders
  devise :database_authenticatable, :registerable, :validatable
end
