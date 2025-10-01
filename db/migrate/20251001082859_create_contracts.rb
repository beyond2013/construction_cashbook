class CreateContracts < ActiveRecord::Migration[8.0]
  def change
    create_table :contracts do |t|
      t.references :project, null: false, foreign_key: true
      t.references :contractor, null: false, foreign_key: true
      t.decimal :value
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
