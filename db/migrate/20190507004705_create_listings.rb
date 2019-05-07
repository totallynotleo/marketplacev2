class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.integer :cost
      t.text :description

      t.timestamps
    end
  end
end
