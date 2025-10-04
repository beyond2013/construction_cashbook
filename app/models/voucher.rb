class Voucher < ApplicationRecord
  belongs_to :project
  has_many :voucher_entries, inverse_of: :voucher, dependent: :destroy
  validates :voucher_date, presence: true
  accepts_nested_attributes_for :voucher_entries, allow_destroy: true
  
end
