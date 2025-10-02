json.extract! voucher, :id, :date, :voucher_number, :voucher_type, :description, :project_id, :created_at, :updated_at
json.url voucher_url(voucher, format: :json)
