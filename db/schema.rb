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

ActiveRecord::Schema.define(version: 2020_04_23_074616) do

  create_table "ms_hirise_staffs", primary_key: "staff_no", id: :string, limit: 4, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "staff_name", limit: 72
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tr_contact_histories", primary_key: "unique_id", id: :bigint, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ms_hirise_staff_id", limit: 4
    t.datetime "contact_datetime", null: false
    t.integer "contact_registration_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ms_hirise_staff_id"], name: "index_tr_contact_histories_on_ms_hirise_staff_id"
  end

  add_foreign_key "tr_contact_histories", "ms_hirise_staffs", primary_key: "staff_no"
end
