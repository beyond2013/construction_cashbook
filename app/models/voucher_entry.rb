class VoucherEntry < ApplicationRecord
  belongs_to :voucher
  belongs_to :account

  validates  :entry_type, presence: true, inclusion: {in: ['debit', 'credit']}
  validates :amount, presence: true, numericality: {greater_than: 0}
end
