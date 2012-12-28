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

ActiveRecord::Schema.define(:version => 20121227231721) do

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "token_s"
    t.boolean  "admin",           :default => false
    t.integer  "status",          :default => 101
    t.string   "token_u"
    t.string   "name"
    t.string   "org"
    t.string   "title"
    t.string   "email_pref"
    t.string   "tel_pref"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["token_s"], :name => "index_users_on_token_s", :unique => true

end