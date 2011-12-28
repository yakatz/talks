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

ActiveRecord::Schema.define(:version => 20111228013137) do

  create_table "lists", :force => true do |t|
    t.string   "name",        :default => ""
    t.text     "short_descr", :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "long_descr",  :default => ""
  end

  create_table "lists_owners", :id => false, :force => true do |t|
    t.integer "owned_list_id"
    t.integer "owner_id"
  end

  add_index "lists_owners", ["owned_list_id"], :name => "index_lists_owners_on_owned_list_id"
  add_index "lists_owners", ["owner_id"], :name => "index_lists_owners_on_owner_id"

  create_table "lists_posters", :id => false, :force => true do |t|
    t.integer "poster_list_id"
    t.integer "poster_id"
  end

  add_index "lists_posters", ["poster_id"], :name => "index_lists_posters_on_poster_id"
  add_index "lists_posters", ["poster_list_id"], :name => "index_lists_posters_on_poster_list_id"

  create_table "lists_talks", :id => false, :force => true do |t|
    t.integer "list_id"
    t.integer "talk_id"
  end

  add_index "lists_talks", ["list_id"], :name => "index_lists_talks_on_list_id"
  add_index "lists_talks", ["talk_id"], :name => "index_lists_talks_on_talk_id"

  create_table "talks", :force => true do |t|
    t.text     "title",      :default => ""
    t.text     "abstract",   :default => ""
    t.text     "speaker",    :default => ""
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  add_index "talks", ["start_time"], :name => "index_talks_on_start_time"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                                  :default => ""
    t.boolean  "perm_site_admin",                       :default => false
    t.boolean  "perm_create_talk"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end