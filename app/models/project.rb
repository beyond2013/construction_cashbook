class Project < ApplicationRecord
  belongs_to :client
  has_many :contracts
  has_many :contrators, through: :contracts
end
