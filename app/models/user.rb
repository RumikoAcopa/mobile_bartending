class User < ApplicationRecord
  has_many :orders
  #has_many :drinks, through: :orders
  devise :database_authenticatable, :registerable, :validatable
end
