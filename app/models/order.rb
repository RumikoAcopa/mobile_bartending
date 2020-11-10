class Order < ApplicationRecord
  belongs_to :user
  #has_many :drink
  validates :quantity, presence: true # need to add user_id once ready for nestedroute
end
