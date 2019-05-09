class Listing < ApplicationRecord
  belongs_to :user
  has_many :orders, :through => :listing_orders

  has_one_attached :image

  validates :title, presence: true 
  validates :user_id, presence: true 
  validates :cost, presence: true 
  validates :description, presence: true 
end
