class LineItem < ApplicationRecord
  belongs_to :listing
  belongs_to :cart

  def total_price
    # listing.cost.to_i * duration.to_i
  end

end
