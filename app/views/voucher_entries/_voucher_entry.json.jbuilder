json.extract! voucher_entry, :id, :voucher_id, :account_id, :debit, :credit, :narration, :created_at, :updated_at
json.url voucher_entry_url(voucher_entry, format: :json)
