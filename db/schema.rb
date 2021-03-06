# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_28_155321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bikes", force: :cascade do |t|
    t.string "marque"
    t.string "category"
    t.text "description"
    t.text "address"
    t.integer "zipcode"
    t.integer "age"
    t.bigint "profil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.integer "price_per_day"
    t.float "latitude"
    t.float "longitude"
    t.index ["profil_id"], name: "index_bikes_on_profil_id"
  end

  create_table "profils", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "address"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tel"
    t.string "iban"
    t.string "photo"
    t.index ["user_id"], name: "index_profils_on_user_id"
  end

  create_table "rents", force: :cascade do |t|
    t.string "period"
    t.bigint "bike_id"
    t.bigint "profil_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bike_id"], name: "index_rents_on_bike_id"
    t.index ["profil_id"], name: "index_rents_on_profil_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bikes", "profils"
  add_foreign_key "profils", "users"
  add_foreign_key "rents", "bikes"
  add_foreign_key "rents", "profils"
end
