# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_10_02_073144) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "account_type"
    t.decimal "opening_balance"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_accounts_on_active"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.text "address"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_clients_on_account_id"
  end

  create_table "contractors", force: :cascade do |t|
    t.string "name"
    t.string "contractor_type"
    t.string "specialization"
    t.string "phone"
    t.string "email"
    t.bigint "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_contractors_on_account_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "contractor_id", null: false
    t.decimal "value"
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contractor_id"], name: "index_contracts_on_contractor_id"
    t.index ["project_id"], name: "index_contracts_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "client_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
  end

  create_table "voucher_entries", force: :cascade do |t|
    t.bigint "voucher_id", null: false
    t.bigint "account_id", null: false
    t.decimal "debit"
    t.decimal "credit"
    t.string "narration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_voucher_entries_on_account_id"
    t.index ["voucher_id"], name: "index_voucher_entries_on_voucher_id"
  end

  create_table "vouchers", force: :cascade do |t|
    t.date "date"
    t.string "voucher_number"
    t.string "voucher_type"
    t.text "description"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_vouchers_on_project_id"
  end

  add_foreign_key "clients", "accounts"
  add_foreign_key "contractors", "accounts"
  add_foreign_key "contracts", "contractors"
  add_foreign_key "contracts", "projects"
  add_foreign_key "projects", "clients"
  add_foreign_key "voucher_entries", "accounts"
  add_foreign_key "voucher_entries", "vouchers"
  add_foreign_key "vouchers", "projects"
end
