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

ActiveRecord::Schema.define(version: 20161015110404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "documents", force: :cascade do |t|
    t.string  "document_name", limit: 255
    t.string  "document_path", limit: 255
    t.boolean "status",                    default: true
  end

  create_table "employee_details", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.string   "emp_name",            limit: 255
    t.string   "last_name",           limit: 255
    t.string   "middle_name",         limit: 255
    t.string   "pan_number",          limit: 255
    t.string   "pf_number",           limit: 255
    t.string   "gender",              limit: 255
    t.string   "martial_status",      limit: 255
    t.date     "dob"
    t.date     "date_of_join"
    t.integer  "role_id"
    t.string   "contact_no",          limit: 255
    t.string   "official_mailid",     limit: 255
    t.string   "password",            limit: 255
    t.string   "manager_mailid",      limit: 255
    t.string   "empl_id",             limit: 255
    t.string   "tl_mailid",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reset_password_code"
    t.string   "active_resetcode",                default: "false",  null: false
    t.string   "active",              limit: 255, default: "Active"
    t.integer  "office_type_id"
    t.string   "office_contact_no",   limit: 255
    t.integer  "office_type"
    t.string   "pf_uan_no"
  end

  create_table "leave_details", force: :cascade do |t|
    t.integer  "employee_detail_id"
    t.integer  "leave_type_id"
    t.float    "total_leaves"
    t.float    "balance"
    t.float    "availed"
    t.float    "carry_forward"
    t.integer  "year"
    t.float    "total_leave_balance"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leave_records", force: :cascade do |t|
    t.integer  "leave_type_id"
    t.float    "no_of_days"
    t.integer  "employee_detail_id"
    t.integer  "year"
    t.date     "from_date"
    t.date     "to_date"
    t.string   "reason",             limit: 255
    t.string   "status",             limit: 255, default: "Pending", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leave_types", force: :cascade do |t|
    t.string "leave_types",  limit: 255
    t.float  "total_leaves"
  end

  create_table "office_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personal_details", force: :cascade do |t|
    t.integer  "employee_detail_id"
    t.integer  "pg_year"
    t.integer  "ug_year"
    t.integer  "diploma_year"
    t.integer  "puc_year"
    t.integer  "tenth_year"
    t.date     "anniversary_date"
    t.date     "p_dob"
    t.string   "local_address",      limit: 255
    t.string   "permanent_address",  limit: 255
    t.string   "changeof_address",   limit: 255
    t.string   "personalmail_id",    limit: 255
    t.string   "emergency_contact",  limit: 255
    t.string   "blood_group",        limit: 255
    t.string   "father_name",        limit: 255
    t.string   "mother_name",        limit: 255
    t.string   "company_name",       limit: 255
    t.string   "designation",        limit: 255
    t.string   "experience",         limit: 255
    t.string   "pg",                 limit: 255
    t.string   "ug",                 limit: 255
    t.string   "diploma",            limit: 255
    t.string   "puc",                limit: 255
    t.string   "tenth",              limit: 255
    t.string   "guardian",           limit: 255
    t.string   "relationship",       limit: 255
    t.string   "company_name2",      limit: 255
    t.string   "designation2",       limit: 255
    t.string   "experience2",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "passport_number"
    t.string   "linkedin_url"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.string   "pf_uan_no"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_name", limit: 255
  end

end
