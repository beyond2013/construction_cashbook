class Contractor < ApplicationRecord
  belongs_to :account
  has_many :contracts
  has_many :projects, through: :contracts
end
