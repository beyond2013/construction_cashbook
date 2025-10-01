class CreateContractors < ActiveRecord::Migration[8.0]
  def change
    create_table :contractors do |t|
      t.string :name
      t.string :contractor_type
      t.string :specialization
      t.string :phone
      t.string :email
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
