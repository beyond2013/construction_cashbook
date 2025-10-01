json.extract! contractor, :id, :name, :contractor_type, :specialization, :phone, :email, :account_id, :created_at, :updated_at
json.url contractor_url(contractor, format: :json)
