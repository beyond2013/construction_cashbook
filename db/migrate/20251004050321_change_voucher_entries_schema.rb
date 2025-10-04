class ChangeVoucherEntriesSchema < ActiveRecord::Migration[8.0]
   def change
  remove_column :voucher_entries, :debit, :decimal
  remove_column :voucher_entries, :credit, :decimal
  add_column :voucher_entries, :entry_type, :string
  add_column :voucher_entries, :amount, :decimal, precision: 15, scale: 2
  end
end