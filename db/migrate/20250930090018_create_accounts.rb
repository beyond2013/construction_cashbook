class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :code
      t.string :account_type
      t.decimal :opening_balance
      t.boolean :active

      t.timestamps
    end
    add_index :accounts, :active
  end
end
