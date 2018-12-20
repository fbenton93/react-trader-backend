class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :password_confirmation
      t.integer :balance, :default => 1000000

      t.timestamps
    end
  end
end
