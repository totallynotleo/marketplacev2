class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, null: false
      t.string :shipping_address, null: false

      t.timestamps
    end
  end
end
