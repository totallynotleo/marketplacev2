class AddDurationToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :duration, :integer, default: 1
  end
end
