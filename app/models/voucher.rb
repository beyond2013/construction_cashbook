class Voucher < ApplicationRecord
  belongs_to :project
  has_many :voucher_entries 
  validates :voucher_date, presence: true
  accepts_nested_attributes_for :voucher_entries
  
end
