json.extract! client, :id, :name, :email, :phone, :address, :account_id, :created_at, :updated_at
json.url client_url(client, format: :json)
