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

ActiveRecord::Schema.define(:version => 20110827182938) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.boolean  "in_state"
    t.integer  "type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colleges", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "state_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "colleges", ["category_id"], :name => "index_colleges_on_category_id"
  add_index "colleges", ["state_id"], :name => "index_colleges_on_state_id"

  create_table "loan_options", :force => true do |t|
    t.string   "name"
    t.string   "range"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_options", :force => true do |t|
    t.string   "name"
    t.integer  "duration"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", :force => true do |t|
    t.float    "adjusted_gross_income"
    t.float    "after_adjusted_gross_input"
    t.float    "tax_credit"
    t.float    "money_contribute_to_college"
    t.float    "expense_for_child"
    t.float    "monthly_paid_off"
    t.float    "something_for_vacation"
    t.float    "save_after_child_to_college"
    t.float    "money_save_for_college"
    t.float    "willing_for_pay_college"
    t.float    "result"
    t.integer  "loan_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "surveys", ["loan_option_id"], :name => "index_surveys_on_loan_option_id"

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "login",                :limit => 80
    t.date     "access_until"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role_id"], :name => "index_users_on_role_id"

end
