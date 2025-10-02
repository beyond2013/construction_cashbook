class CreateVouchers < ActiveRecord::Migration[8.0]
  def change
    create_table :vouchers do |t|
      t.date :date
      t.string :voucher_number
      t.string :voucher_type
      t.text :description
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
