# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120725093427) do

  create_table "employee_details", :force => true do |t|
    t.string   "title"
    t.string   "emp_name"
    t.integer  "emp_id"
    t.datetime "dob"
    t.string   "gender"
    t.string   "martial_status"
    t.string   "contact_no"
    t.string   "blood_group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leave_records", :force => true do |t|
    t.integer  "leave_type_id"
    t.datetime "from_date"
    t.datetime "to_date"
    t.string   "reason"
    t.integer  "no_of_days"
  end

  create_table "leave_types", :force => true do |t|
    t.string  "leave_types"
    t.integer "total_leaves"
  end

  create_table "logs", :force => true do |t|
    t.string   "username"
    t.integer  "employee_id"
    t.string   "password"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "personal_details", :force => true do |t|
    t.integer  "employee_detail_id"
    t.string   "officialmail_id"
    t.string   "personalmail_id"
    t.datetime "anniversary_date"
    t.string   "local_address"
    t.string   "permanent_address"
    t.string   "emergency_contact"
    t.string   "changeof_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
