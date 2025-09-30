json.extract! account, :id, :name, :code, :account_type, :opening_balance, :active, :created_at, :updated_at
json.url account_url(account, format: :json)
