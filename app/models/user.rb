class User < ApplicationRecord
  has_many :drinks
  #has_many :ordered_drinks, through: :orders, source: :drink
  devise :database_authenticatable, :registerable, :validatable
end
