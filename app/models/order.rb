class Order < ApplicationRecord
  belongs_to :user
  has_many :listings, :through => :listing_orders
  validates :user_id, presence: true 
  validates :shipping_address, presence: true 
end
