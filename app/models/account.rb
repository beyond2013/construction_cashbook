class Account < ApplicationRecord
  has_many :voucher_entries
  validates :name, presence: true
end
