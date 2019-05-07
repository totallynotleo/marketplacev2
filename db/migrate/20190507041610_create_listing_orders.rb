class CreateListingOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :listing_orders do |t|
      t.references :listing, foreign_key: true
      t.integer :duration
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
