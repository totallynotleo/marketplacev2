class AddUsernameColumnToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :username, :string
  end
end
