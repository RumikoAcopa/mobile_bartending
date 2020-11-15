class DrinkOrder < ApplicationRecord
  belongs_to :user
  belongs_to :drink #, counter_cache: :quantity_count
  
  validates :user_id, :drink_id, :special_instructions, :quantity, presence: true

end
