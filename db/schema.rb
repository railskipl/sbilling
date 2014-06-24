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

ActiveRecord::Schema.define(:version => 20140624095658) do

  create_table "consumers", :force => true do |t|
    t.string   "consumer_no"
    t.string   "consumer_name"
    t.string   "bill_month"
    t.date     "due_date"
    t.float    "arrear"
    t.string   "last_bill_amount"
    t.date     "last_paid_date"
    t.integer  "current_dues"
    t.integer  "net_bill_amt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "transaction_id"
    t.string   "reciept_no"
    t.datetime "paid_date"
    t.string   "paid_amt"
    t.string   "recieved_by"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.integer  "role_id",                :default => 2
    t.string   "username"
  end

end
