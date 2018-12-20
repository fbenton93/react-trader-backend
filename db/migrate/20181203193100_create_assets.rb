class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.string :ticker
      t.string :name
      t.float :price
      t.integer :quantity
      t.string :user_id
      t.boolean :open, :default => true

      t.timestamps
    end
    add_index :assets, :user_id
    add_index :assets, :open
  end
end
