class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :address
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
