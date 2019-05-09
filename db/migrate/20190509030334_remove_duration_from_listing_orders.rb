class RemoveDurationFromListingOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :listing_orders, :duration, :integer
  end
end
