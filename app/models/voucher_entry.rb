class VoucherEntry < ApplicationRecord
  belongs_to :voucher
  belongs_to :account
  validates :amount, presence: true, numericality: true
end
