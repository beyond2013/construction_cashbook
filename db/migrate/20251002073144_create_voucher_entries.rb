class CreateVoucherEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :voucher_entries do |t|
      t.references :voucher, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.decimal :debit
      t.decimal :credit
      t.string :narration

      t.timestamps
    end
  end
end
