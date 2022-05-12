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

ActiveRecord::Schema.define(:version => 20130304202601) do

  create_table "proposals", :force => true do |t|
    t.string   "title"
    t.text     "short_abstract"
    t.text     "proposal"
    t.string   "talk_type"
    t.text     "special_requirements"
    t.integer  "speaker_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.text     "prior_presentation"
  end

  add_index "proposals", ["speaker_id"], :name => "index_proposals_on_speaker_id"

  create_table "speakers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "website"
    t.text     "bio"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "handle",             :default => "", :null => false
    t.string   "password",           :default => "", :null => false
    t.integer  "sign_in_count",      :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["provider", "handle"], :name => "index_users_on_provider_and_handle", :unique => true

end
